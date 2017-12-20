<?php

/*
 * This file is part of WyndApiCore bundle.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ApiBundle\Command;

use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;

class ImportProductCommand extends ContainerAwareCommand
{

    protected function configure()
    {
        $this
            ->setName('greenweez:import:product')
            ->setDescription('import json data from greenweez.')
            ->setHelp('This command import greenweez products once a day')
            ->addArgument('file_path', InputArgument::OPTIONAL, 'chemin du fichier')
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
        $filePath = $input->getArgument('file_path');

        if ($filePath !== null && !is_file($filePath)) {
            throw new \Exception("File not found : '" . $filePath . "'!");
        }

        if ($this->getContainer()->get('greenweez_import')->importProduct($filePath)) {
            $output->writeln('File imported');
        }
    }
}
