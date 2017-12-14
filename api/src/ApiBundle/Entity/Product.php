<?php

/*
 * This file is part of a Wynd project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use WyndApi\WyndApiCoreBundle\Entity\ProductInterface;
use WyndApi\WyndApiCoreBundle\Entity\Super\Product as baseProduct;
use JMS\Serializer\Annotation as JMS;

/**
 * @ORM\Entity(repositoryClass="WyndApi\WyndApiCoreBundle\Repository\ProductRepository")
 * @ORM\Table(name="llx_product")
 * @ORM\HasLifecycleCallbacks()
 */
class Product extends baseProduct implements ProductInterface
{
    /**
     * @var string

     * @code()
     * @ORM\Column(length=100)
     * @JMS\Groups(groups={"listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $code;


    /**
     * @var string
     *
     * @ORM\Column(length=128)
     * @JMS\Groups(groups={"list", "product", "listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $image_path;

    /**
     * @var string
     *
     * @ORM\Column(length=128)
     * @JMS\Groups(groups={"list", "product", "listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $title;

    /**
     * @var string
     *
     * @ORM\Column(length=128)
     * @JMS\Groups(groups={"list", "product", "listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $format;

    /**
     * Set code
     *
     * @param string $code
     *
     * @return Product
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set imagePath
     *
     * @param string $imagePath
     *
     * @return Product
     */
    public function setImagePath($imagePath)
    {
        $this->image_path = $imagePath;

        return $this;
    }

    /**
     * Get imagePath
     *
     * @return string
     */
    public function getImagePath()
    {
        return $this->image_path;
    }

    /**
     * Set title
     *
     * @param string $title
     *
     * @return Product
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set format
     *
     * @param string $format
     *
     * @return Product
     */
    public function setFormat($format)
    {
        $this->format = $format;

        return $this;
    }

    /**
     * Get format
     *
     * @return string
     */
    public function getFormat()
    {
        return $this->format;
    }
}
