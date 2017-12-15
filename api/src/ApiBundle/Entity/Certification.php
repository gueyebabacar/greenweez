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
     *
     * @ORM\Column(length=255)
     * @JMS\Groups(groups={"list", "product", "listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $image_path;

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

}
