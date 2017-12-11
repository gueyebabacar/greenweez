<?php

namespace ApiBundle\Service;

use JMS\Serializer\DeserializationContext;
use Symfony\Component\DependencyInjection\ContainerInterface;
use WyndApi\WyndApiCoreBundle\Entity\ProductInterface;


class GreenWeezImportFile
{
    /**
     * @var rootDir
     */
    protected $rootDir;

    /**
     * @var ContainerInterface
     */
    protected $container;

    /**
     * GreenWeezImportFile constructor.
     * @param $rootDir
     * @param $container
     */
    public function __construct($rootDir, ContainerInterface $container)
    {
        $this->rootDir = realpath($rootDir . '/../web');
        $this->container = $container;
    }

    /**
     * @return bool|string
     */
    public function importGreenweezJsonFile() {

        $file = $this->getPath('products.json');
        $jsonData = file_get_contents($file);
        $type = sprintf('array<%s>', ProductInterface::class);
        $productManager = $this->container->get('api.product_manager');
        $products = $this->container->get('jms_serializer')->fromArray(\GuzzleHttp\json_decode($jsonData, true), $type, DeserializationContext::create());
        $validator = $this->container->get('validator');

        $batchSize = 20;
        foreach ($products as $i => $product) {
            $errors = count($validator->validate($product));
            if ($errors > 0) {
                var_dump($errors);
            }
            $productManager->save($product, false);
            if (($i % $batchSize) === 0) {
                $productManager->flush();
                $productManager->clear(); // Detaches all objects from Doctrine!
            }
        }
        $productManager->flush(); //Persist objects that did not make up an entire batch
        $productManager->clear();

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