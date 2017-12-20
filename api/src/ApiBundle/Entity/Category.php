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
use WyndApi\WyndApiCoreBundle\Entity\CategoryInterface;
use WyndApi\WyndApiCoreBundle\Entity\Super\Category as baseCategory;
use JMS\Serializer\Annotation as JMS;
use Gedmo\Mapping\Annotation as Gedmo;


/**
 * @ORM\Entity(repositoryClass="WyndApi\WyndApiCoreBundle\Repository\CategoryRepository")
 * @ORM\Table(name="llx_categorie")
 * @ORM\HasLifecycleCallbacks()
 */
class Category extends baseCategory implements CategoryInterface
{

    /**
     * @var bool
     *
     * @ORM\Column(type="boolean", name="is_default")
     * @JMS\Groups(groups={"list", "tree", "synchronizationCategory"})
     */
    protected $isDefault = false;

    /**
     * @var int
     *
     * @Gedmo\SortablePosition
     * @ORM\Column(type="integer", length=25)
     * @JMS\Groups(groups={"list", "tree", "synchronizationCategory"})
     */
    protected $sort = 1;

    /**
     * Category constructor.
     */
    public function __construct() {
        parent::__construct();
    }

}
