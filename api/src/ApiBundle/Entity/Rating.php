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
 * @ORM\Table(name="llx_rating")
 * @ORM\Entity()
 * @ORM\HasLifecycleCallbacks()
 */
class Rating implements EntityObjectInterface
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
     * @var decimal
     * @ORM\Column(type="decimal", length=24, scale=8, nullable=true)
     * @JMS\Groups(groups={"listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $average;

    /**
     *
     * @ORM\Column(type="integer", length=25)
     * @JMS\Groups(groups={"listProduct", "treeProduct", "synchronizationProduct"})
     */
    protected $count;


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
     * @return decimal
     */
    public function getAverage()
    {
        return $this->average;
    }

    /**
     * @param decimal $average
     * @return Rating
     */
    public function setAverage($average)
    {
        $this->average = $average;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getCount()
    {
        return $this->count;
    }

    /**
     * @param mixed $count
     * @return Rating
     */
    public function setCount($count)
    {
        $this->count = $count;
        return $this;
    }

}
