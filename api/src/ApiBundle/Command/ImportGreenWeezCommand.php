<?php

/*
 * This file is part of WyndApiCore bundle.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Command;

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;

class ImportGreenWeezCommand extends ContainerAwareCommand
{
    /** @var Kernel $kernel */
    protected $kernel;

    protected function configure()
    {
        $this
            ->setName('greenweez:import')
            ->setDescription('import json data from greenweez.')
            ->setHelp('This command import greenweez products once a day')
        ;
    }

    /**
     * @param InputInterface $input
     * @param OutputInterface $output
     * @return int|null|void
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $this->getContainer()->get('greenweez_import')->importGreenweezJsonFile();

    }
}
