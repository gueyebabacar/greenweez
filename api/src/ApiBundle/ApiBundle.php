<?php

namespace ApiBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;
use ApiBundle\DependencyInjection\Compiler\OverrideServiceCompilerPass;
use Symfony\Component\DependencyInjection\ContainerBuilder;

class ApiBundle extends Bundle
{
    /**
     * @param ContainerBuilder $containerBuilder
     */
    public function build(ContainerBuilder $containerBuilder)
    {
        parent::build($containerBuilder);

        $containerBuilder->addCompilerPass(new OverrideServiceCompilerPass());
    }
}
