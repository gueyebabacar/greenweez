<?php

/*
 * This file is part of a Wynd project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use WyndApi\WyndApiCoreBundle\Entity\ProductInterface;
use WyndApi\WyndApiCoreBundle\Entity\Super\Product as baseProduct;
use JMS\Serializer\Annotation as JMS;
use Symfony\Component\Validator\Constraints as Assert;
use ApiBundle\Entity\Certification;


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
    protected $image_high_res_url;

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
     * @ORM\OneToOne(targetEntity="ApiBundle\Entity\Brand", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="brand_id", referencedColumnName="rowid")
     */
    private $brand;

    /**
     * @ORM\OneToOne(targetEntity="ApiBundle\Entity\Rating", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="rating_id", referencedColumnName="rowid")
     */
    private $ratings;


    /**
     * @var ArrayCollection $certificates
     *
     * @ORM\ManyToMany(targetEntity="ApiBundle\Entity\Certification", inversedBy="products", cascade={"persist"})
     * @ORM\JoinTable(name="llx_product_certification",
     *      joinColumns={@ORM\JoinColumn(name="product_id", referencedColumnName="rowid")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="certification_id", referencedColumnName="rowid")}
     * )
     */
    protected $certifications;

    /**
     * @return ArrayCollection
     */
    public function getCertifications()
    {
        return $this->certifications;
    }

    /**
     * @param ArrayCollection $certifications
     */
    public function setCertifications($certifications)
    {
        $this->certifications = $certifications;
    }


    /**
     * @var ProductAssociation[]
     *
     * @ORM\OneToMany(targetEntity="\WyndApi\WyndApiCoreBundle\Entity\ProductAssociation", mappedBy="productParent", cascade={"persist", "merge"}, orphanRemoval=true)
     *
     * @JMS\Accessor(getter="getAssociationChildren",setter="setChildren")
     * @JMS\Groups(groups={"treeProduct"})
     * @JMS\SerializedName("associated_products")
     * @Assert\Valid()
     * @ORM\OrderBy({"entity" = "ASC", "position" = "ASC"})
     */
    protected $associationChildren;

    public function __construct()
    {
        parent::__construct();

        $this->certifications = new ArrayCollection();
    }

    /**
     * @return mixed
     */
    public function getBrand()
    {
        return $this->brand;
    }

    /**
     * @param mixed $brand
     */
    public function setBrand($brand)
    {
        $this->brand = $brand;
    }

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

    /**
     * @param $ratings
     * @return $this
     */
    public function setRatings($ratings)
    {
        $this->ratings = $ratings;

        return $this;
    }

    /**
     * Get ratings
     *
     * @return string
     */
    public function getRatings()
    {
        return $this->ratings;
    }

    /**
     * @return string
     */
    public function getImageHighResUrl()
    {
        return $this->image_high_res_url;
    }

    /**
     * @param string $image_high_res_url
     * @return Product
     */
    public function setImageHighResUrl($image_high_res_url)
    {
        $this->image_high_res_url = $image_high_res_url;
        return $this;
    }

    /**
     * @param string $ref
     *
     * @return $this
     */
    public function setRef($ref)
    {
        $this->ref = $ref;

        return parent::setRef($this->ref);

    }


}
