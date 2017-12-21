<?php

namespace ApiBundle\Service;

use ApiBundle\Entity\Certification;
use JMS\Serializer\DeserializationContext;
use WyndApi\WyndApiCoreBundle\Entity\CategoryInterface;
use WyndApi\WyndApiCoreBundle\Entity\ProductInterface;
use JMS\Serializer\SerializerInterface;
use WyndApi\WyndApiCoreBundle\Manager\BaseManager;
use WyndApi\WyndApiCoreBundle\Manager\CategoryManager;
use WyndApi\WyndApiCoreBundle\Manager\ProductManager;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use ApiBundle\Entity\Brand;

class ImportService
{
    /**
     * @var SerializerInterface
     */
    protected $serializer;

    /**
     * @var BaseManager
     */
    protected $baseManager;

    /**
     * @var ProductManager
     */
    protected $productManager;

    /**
     * @var CategoryManager
     */
    protected $categoryManager;

    /**
     * @var ValidatorInterface
     */
    protected $validator;


    /**
     * GreenWeezImportFile constructor.
     * @param $serializer
     * @param $productManager
     * @param $validator
     * @param $baseManager
     * @param $categoryManager
     */
    public function __construct(SerializerInterface $serializer, ProductManager $productManager, CategoryManager $categoryManager, BaseManager $baseManager, ValidatorInterface $validator)
    {
        $this->serializer = $serializer;
        $this->productManager = $productManager;
        $this->categoryManager = $categoryManager;
        $this->baseManager = $baseManager;
        $this->validator = $validator;
    }

    /**
     * @param $filePath
     * @return bool
     * @throws \Exception
     *
     */
    public function importProduct($filePath) {

        $jsonData = file_get_contents($filePath);
        $type = sprintf('array<%s>', ProductInterface::class);
        $productsArray = \GuzzleHttp\json_decode($jsonData, true);
        $products = $this->serializer->fromArray($productsArray['products'], $type, DeserializationContext::create());

        $batchSize = 20;
        foreach ($products as $i => $product) {
            $errors = $this->validator->validate($product);
            if (count($errors) > 0) {
                throw new \Exception('An error has occured while importing products entity is not valid');
            } else {
                $this->productManager->save($product, false);
                if ((($i +1) % $batchSize) === 0) {
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
     * @param $filePath
     * @return bool
     * @throws \Exception
     */
    public function importCategories($filePath) {

        $jsonData = file_get_contents($filePath);
        $type = sprintf('array<%s>', CategoryInterface::class);
        $categoriesArray = \GuzzleHttp\json_decode($jsonData, true);
        $categories = $this->serializer->fromArray($categoriesArray['categories'], $type, DeserializationContext::create());

        $batchSize = 20;
        foreach ($categories as $i => $category) {
            $errors = $this->validator->validate($category);
            if (count($errors) > 0) {
                throw new \Exception('An error has occured while importing categories entity is not valid');
            } else {
                $this->categoryManager->save($category, false);
                if ((($i + 1) % $batchSize) === 0) {
                    $this->categoryManager->flush();
                    $this->categoryManager->clear(); // Detaches all objects from Doctrine!
                }
            }
        }
        $this->categoryManager->flush(); //Persist objects that did not make up an entire batch
        $this->categoryManager->clear();

        return true;
    }

    /**
     * @param $filePath
     * @return bool
     * @throws \Exception
     */
    public function importBrand($filePath) {

        $jsonData = file_get_contents($filePath);
        $type = sprintf('array<%s>', Brand::class);

        $brandsArray = \GuzzleHttp\json_decode($jsonData, true);
        $brands = $this->serializer->fromArray($brandsArray['brands'], $type, DeserializationContext::create());

        $batchSize = 20;
        foreach ($brands as $i => $brand) {
            $errors = $this->validator->validate($brand);
            if (count($errors) > 0) {
                throw new \Exception('An error has occured while importing brand entity is not valid');
            } else {
                $this->baseManager->save($brand, false);
                if ((($i + 1) % $batchSize) === 0) {
                    $this->baseManager->flush();
                    $this->baseManager->clear(); // Detaches all objects from Doctrine!
                }
            }
        }
        $this->baseManager->flush(); //Persist objects that did not make up an entire batch
        $this->baseManager->clear();

        return true;
    }

    /**
     * @param $filePath
     * @return bool
     * @throws \Exception
     */
    public function importCertification($filePath) {

        $jsonData = file_get_contents($filePath);
        $type = sprintf('array<%s>', Certification::class);

        $certificationsArray = \GuzzleHttp\json_decode($jsonData, true);
        $certifications = $this->serializer->fromArray($certificationsArray['certifications'], $type, DeserializationContext::create());

        $batchSize = 20;
        foreach ($certifications as $i => $certification) {
            $errors = $this->validator->validate($certification);
            if (count($errors) > 0) {
                throw new \Exception('An error has occured while importing certifications entity is not valid');
            } else {
                $this->baseManager->save($certification, false);
                if ((($i +1) % $batchSize) === 0) {
                    $this->baseManager->flush();
                    $this->baseManager->clear(); // Detaches all objects from Doctrine!
                }
            }
        }
        $this->baseManager->flush(); //Persist objects that did not make up an entire batch
        $this->baseManager->clear();

        return true;
    }
}