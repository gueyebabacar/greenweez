<?php

namespace ApiBundle\Service;

use JMS\Serializer\DeserializationContext;
use WyndApi\WyndApiCoreBundle\Entity\ProductInterface;
use JMS\Serializer\SerializerInterface;
use WyndApi\WyndApiCoreBundle\Manager\BaseManager;
use WyndApi\WyndApiCoreBundle\Manager\ProductManager;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Psr\Log\LoggerInterface;
use ApiBundle\Entity\Brand;

class GreenWeezImportFile
{
    /**
     * @var rootDir
     */
    protected $rootDir;

    /**
     * @var SerializerInterface
     */
    protected $serializer;

    /**
     * @var ProductManager
     */
    protected $productManager;

    /**
     * @var BaseManager
     */
    protected $brandManager;

    /**
     * @var ValidatorInterface
     */
    protected $validator;

    /**
     * @var LoggerInterface
     */
    protected $logger;

    /**
     * GreenWeezImportFile constructor.
     * @param $rootDir
     * @param $serializer
     * @param $productManager
     * @param $validator
     * @param $logger
     */
    public function __construct($rootDir, SerializerInterface $serializer, ProductManager $productManager, BaseManager $brandManager, ValidatorInterface $validator, LoggerInterface $logger)
    {
        $this->rootDir = realpath($rootDir . '/../web');
        $this->serializer = $serializer;
        $this->productManager = $productManager;
        $this->brandManager = $brandManager;
        $this->validator = $validator;
        $this->logger = $logger;
    }

    /**
     * @return bool
     * @throws \Exception
     */
    public function importGreenweezJsonFile() {
        $file = $this->getPath('products.json');
        $jsonData = file_get_contents($file);
        $type = sprintf('array<%s>', ProductInterface::class);
        $products = $this->serializer->fromArray(\GuzzleHttp\json_decode($jsonData, true), $type, DeserializationContext::create());

        $batchSize = 20;
        foreach ($products as $i => $product) {
            $errors = count($this->validator->validate($product));
            if ($errors > 0) {
                throw new \Exception('An error has occured while importing products');
            } else {
                $this->productManager->save($product, false);
                if (($i % $batchSize) === 0) {
                    $this->productManager->flush();
                    $this->productManager->clear(); // Detaches all objects from Doctrine!
                }
            }
        }
        $this->productManager->flush(); //Persist objects that did not make up an entire batch
        $this->productManager->clear();

        return true;
    }

    /**
     * @return bool
     * @throws \Exception
     */
    public function importBrandJsonFile() {
        $brands = [];
        $file = $this->getPath('brands.json');
        $jsonData = file_get_contents($file);
        $type = sprintf('array<%s>', Brand::class);

        foreach (\GuzzleHttp\json_decode($jsonData, true) as $i => $data) {
            $brands = $this->serializer->fromArray($data, $type, DeserializationContext::create());
        }

        $batchSize = 20;
        foreach ($brands as $i => $brand) {
            $errors = count($this->validator->validate($brand));
            if ($errors > 0) {
                $this->logger->error($errors);
                throw new \Exception('An error has occured while importing products');
            } else {
                $this->brandManager->save($brand, false);
                if ((($i +1) % $batchSize) === 0) {
                    $this->brandManager->flush();
                    $this->brandManager->clear(); // Detaches all objects from Doctrine!
                }
            }
        }
        $this->brandManager->flush(); //Persist objects that did not make up an entire batch
        $this->brandManager->clear();

        return true;
    }

    /**
     * @param $fileName
     * @return bool|string
     */
    public function getPath($fileName) {

        $path = realpath($this->rootDir.DIRECTORY_SEPARATOR.'GreenWeezData'.DIRECTORY_SEPARATOR.$fileName);

        return $path;
    }
}