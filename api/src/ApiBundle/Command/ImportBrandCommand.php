<?php

/*
 * This file is part of WyndApiCore bundle.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Command;

use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;

class ImportBrandCommand extends ContainerAwareCommand
{

    protected function configure()
    {
        $this
            ->setName('greenweez:import:brand')
            ->setDescription('import brand json data from greenweez.')
            ->setHelp('This command import greenweez products once a day')
        ;
    }

    /**
     * @param InputInterface $input
     * @param OutputInterface $output
     * @return int|null|void
     * @throws \Exception
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        if ($this->getContainer()->get('greenweez_import')->importBrand()) {
            $output->writeln('File imported');
        }
    }
}
