<?php

namespace ApiBundle\Service;

use FOS\RestBundle\Context\Context;
use JMS\Serializer\DeserializationContext;
use JMS\Serializer\SerializationContext;
use WyndApi\WyndApiCoreBundle\Entity\ProductInterface;
use JMS\Serializer\SerializerInterface;
use WyndApi\WyndApiCoreBundle\Manager\OrderManager;

class GreenWeezExtractTransaction
{
    /**
     * @var rootDir
     */
    protected $rootDir;

    /**
     * @var ParamFetcherInterface
     */
    protected $paramFetcher;

    /**
     * @var SerializerInterface
     */
    protected $serializer;

    /**
     * @var OrderManager
     */
    protected $orderManager;

    /**
     * GreenWeezExtractTransaction constructor.
     * @param $rootDir
     * @param $serializer
     * @param $orderManager
     */
    public function __construct($rootDir, SerializerInterface $serializer, OrderManager $orderManager)
    {
        $this->rootDir = realpath($rootDir . '/../web');
        $this->serializer = $serializer;
        $this->orderManager = $orderManager;
    }

    /**
     * @return bool
     * @throws \Exception
     */
    public function extractGreenweezJsonFile() {

        $data = $this->orderManager->findAll();
        $data = $this->serializeData($data);


        return $data;
    }

    /**
     * @param $fileName
     * @return bool|string
     */
    public function getPath($fileName) {

        $path = realpath($this->rootDir.DIRECTORY_SEPARATOR.'GreenWeezData'.DIRECTORY_SEPARATOR.$fileName);

        return $path;
    }

    private function serializeData($data){
        $context = SerializationContext::create();
        $context->setGroups(['id', 'listOrder', 'orders']);
        $context->setSerializeNull(true);
        $context->attributes->set('template_data', []);
        $context->enableMaxDepthChecks();


        $result = $this->serializer->serialize($data, 'json', $context);

        return $result;
    }
}