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

class ExportCommand extends ContainerAwareCommand
{

    protected function configure()
    {
        $this
            ->setName('greenweez:extract')
            ->setDescription('export greeweez orders.')
            ->setHelp('This command export greenweez order')
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

        if ($filePath !== null && !is_dir($filePath)) {
            throw new \Exception("file path: '" . $filePath . "'! not found please enter a existing directory file name will added automatically ");
        }

        if ($this->getContainer()->get('greenweez_extract_command')->extractOrder($filePath)) {
            $output->writeln('greenweez orders exported');
        }
    }
}
