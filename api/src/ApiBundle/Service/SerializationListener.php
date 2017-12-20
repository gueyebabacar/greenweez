<?php

/*
 * This file is part of WyndApiCore bundle.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Service;

use JMS\Serializer\EventDispatcher\EventSubscriberInterface;
use JMS\Serializer\EventDispatcher\PreDeserializeEvent;
use WyndApi\WyndApiCoreBundle\Entity\CategoryInterface;
use WyndApi\WyndApiCoreBundle\Entity\ProductInterface;

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

            if (isset($data['name'])) {
                $data['default_label'] = $data['name'];
                unset($data['name']);
            }
            if (isset($data['sub_categories'])) {
                $data['children'] = $data['sub_categories'];
                unset($data['sub_categories']);
            }

            $event->setData($data);
        } elseif ($typeName === $this->resolveTargetEntities[ProductInterface::class]) {
            // Default values
            $data['entity']['id'] = 1;
            $data['division']['id'] = 1;

            if (isset($data['brand']) && is_integer($data['brand'])) {
                $brand = $data['brand'];
                $data['brand'] = [];
                $data['brand']['id'] = $brand;
            }

            if (isset($data['categories']) && is_array($data['categories'])) {
                foreach ($data['categories'] as &$category) {
                    if (is_integer($category)) {
                        $category = [
                            'category' => [
                                'id' => $category
                            ]

                        ];
                    }
                }
            }

            if (isset($data['associated_products']) && is_array($data['associated_products'])) {
                foreach ($data['associated_products'] as &$associatedProduct) {
                    if (is_integer($associatedProduct)) {
                        $associatedProduct = [
                            'child' => [
                                'id' => $associatedProduct
                            ]

                        ];
                    }
                }
            }

            if (isset($data['certifications']) && is_array($data['certifications'])) {
                $certifications = [];
                foreach ($data['certifications'] as $i => $certification) {
                    $certifications[]['id'] = $certification;
                }

                $data['certifications'] = $certifications;
            }

            if (isset($data['name'])) {
                $data['default_label'] = $data['name'];
                unset($data['name']);
            }

            if (isset($data['description'])) {
                $data['description'] = $data['description']['main'];
                unset($data['description']);
            }

            $event->setData($data);
        }

    }
}
