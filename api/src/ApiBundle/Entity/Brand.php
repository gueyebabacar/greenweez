<?php

/*
 * This file is part of a Wynd project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as JMS;
use WyndApi\WyndApiCoreBundle\Entity\EntityObjectInterface;
use WyndApi\WyndApiCoreBundle\Entity\BrandInterface;

/**
 * @ORM\Table(name="llx_brand")
 * @ORM\Entity()
 * @ORM\HasLifecycleCallbacks()
 */
class Brand implements EntityObjectInterface
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
    protected $rowid;

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @JMS\Groups(groups={"listProduct", "treeProduct", "synchronizationProduct"})
     *
     */
    protected $id;

    /**
     * @var string

     * @code()
     * @ORM\Column(length=100)
     * @JMS\Groups(groups={"listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $name;

    /**
     * @var string
     *
     * @ORM\Column(length=255)
     * @JMS\Groups(groups={"list", "product", "listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $image_path;

    /**
     * @var string
     *
     * @ORM\Column(length=128)
     * @JMS\Groups(groups={"list", "product", "listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $description;


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
     * Set id
     *@param string $id
     * @return integer
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return Brand
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set imagePath
     *
     * @param string $imagePath
     *
     * @return Brand
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
     * Set description
     *
     * @param string $description
     *
     * @return Brand
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
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
     * @return Brand
     */
    public function setRowid($rowid)
    {
        $this->rowid = $rowid;
        return $this;
    }

}
