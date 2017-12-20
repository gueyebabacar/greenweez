<?php

/*
 * This file is part of a Wynd project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as JMS;
use WyndApi\WyndApiCoreBundle\Entity\EntityObjectInterface;
use WyndApi\WyndApiCoreBundle\Entity\CertificatInterface;

/**
 * @ORM\Table(name="llx_certification")
 * @ORM\Entity()
 * @ORM\HasLifecycleCallbacks()
 */
class Certification implements EntityObjectInterface
{

    /**
     * @var int
     *
     * @ORM\Column(name="rowid", type="integer")
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="AUTO")
     *
     * @JMS\Groups(groups={"listProduct", "treeProduct", "listOrder", "tag", "list", "product", "productGroups", "invoice", "tree", "complete", "id"})
     */
    protected $id;

    /**
     * @var string
     *
     * @ORM\Column(length=255)
     * @JMS\Groups(groups={"list", "product", "listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $image_path;


    /**
     * @var Collection $products
     *
     * @ORM\ManyToMany(targetEntity="WyndApi\WyndApiCoreBundle\Entity\ProductInterface", mappedBy="certifications")
     *
     */
    private $products;

    /**
     * Certification constructor.
     */
    public function __construct()
    {
        $this->products = new ArrayCollection();
    }


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param $id
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Set imagePath
     *
     * @param string $imagePath
     *
     * @return Certification
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
     * @return int
     */
    public function getRowid()
    {
        return $this->rowid;
    }

    /**
     * @param int $rowid
     * @return Certification
     */
    public function setRowid($rowid)
    {
        $this->rowid = $rowid;
        return $this;
    }

    /**
     * @return Product
     */
    public function getProducts()
    {
        return $this->products;
    }

    /**
     * @param Product $products
     * @return Certification
     */
    public function setProducts($products)
    {
        $this->products = $products;

        return $this;
    }



}
