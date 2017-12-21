<?php

namespace ApiBundle\Service;

use JMS\Serializer\SerializationContext;
use JMS\Serializer\SerializerInterface;
use WyndApi\WyndApiCoreBundle\Manager\OrderManager;

class ExportService
{

    /**
     * @var SerializerInterface
     */
    protected $serializer;

    /**
     * @var OrderManager
     */
    protected $orderManager;

    /**
     * ExportService constructor.
     * @param $serializer
     * @param $orderManager
     */
    public function __construct(SerializerInterface $serializer, OrderManager $orderManager)
    {
        $this->serializer = $serializer;
        $this->orderManager = $orderManager;
    }

    /**
     * @param $filePath
     * @return bool
     */
    public function extractOrder($filePath) {
        $data = $this->orderManager->findAll();
        $data = $this->serializeData($data);
        $file = $this->getPath($filePath).DIRECTORY_SEPARATOR.'orders.json';

        file_put_contents($file, $data);

        return true;
    }

    /**
     * @param $filePath
     * @return bool|string
     */
    public function getPath($filePath) {

        if (substr($filePath, -1) == '/') {
            $filePath = substr($filePath, 0, -1);
        }

        return $filePath;
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