<?php

/*
 * This file is part of WyndApiCore bundle.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Service;

use ApiBundle\Entity\Category;
use JMS\Serializer\EventDispatcher\EventSubscriberInterface;
use JMS\Serializer\EventDispatcher\PreDeserializeEvent;
use JMS\Serializer\EventDispatcher\PreSerializeEvent;
use JMS\Serializer\Metadata\PropertyMetadata;
use WyndApi\WyndApiCoreBundle\Entity\CategoryInterface;
use WyndApi\WyndApiCoreBundle\Entity\Product;
use WyndApi\WyndApiCoreBundle\Entity\ProductInterface;
use WyndApi\WyndApiCoreBundle\Entity\Super\Address;
use JMS\Serializer\EventDispatcher\ObjectEvent;
use WyndApi\WyndApiCoreBundle\Manager\ProductManager;

/**
 * Add data after serialization.
 */
class SerializationListener implements EventSubscriberInterface
{

    private $resolveTargetEntities = [];

    /**
     * SerializationListener constructor.
     * @param array $resolveTargetEntities
     */
    public function __construct(array $resolveTargetEntities)
    {
        $this->resolveTargetEntities = $resolveTargetEntities;
    }


    /**
     * {@inheritdoc}
     */
    public static function getSubscribedEvents()
    {
        return [
            ['event' => 'serializer.pre_deserialize', 'method' => 'onPreDeserialize'],
        ];
    }


    /**
     * Injecting Address URL's attributes (entity and entity_id) in the input data.
     *
     * @param PreDeserializeEvent $event
     */
    public function onPreDeserialize(PreDeserializeEvent $event)
    {
        $type = $event->getType();
        $typeName = $type['name'];
        //Get input data
        $data = $event->getData();

        // Execute this only when it is Category class
        if ($typeName === $this->resolveTargetEntities[CategoryInterface::class]) {
            // Default values
            $data['entity']['id'] = 1;

            if(isset($data['name'])) {
                $data['default_label'] = $data['name'];
                unset($data['name']);
            }
            if(isset($data['sub_categories'])) {
                $data['children'] = $data['sub_categories'];
                unset($data['sub_categories']);
            }

            $event->setData($data);
        }


    }

}
