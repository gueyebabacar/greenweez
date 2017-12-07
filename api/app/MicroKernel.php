<?php

/*
 * This file is part of a Wynd project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

use Doctrine\Common\Annotations\AnnotationRegistry;
use Symfony\Bundle\FrameworkBundle\Kernel\MicroKernelTrait;
use Symfony\Component\Config\Loader\LoaderInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Routing\RouteCollectionBuilder;

class MicroKernel extends Kernel
{
    use MicroKernelTrait;

    public function __construct($environment, $debug)
    {
        date_default_timezone_set('Europe/Paris');
        $loader = require __DIR__.'/../vendor/autoload.php';
        AnnotationRegistry::registerLoader([$loader, 'loadClass']);
        parent::__construct($environment, $debug);
    }

    public function registerBundles()
    {
        $bundles = [
            new \Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
            new \Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new \Symfony\Bundle\SecurityBundle\SecurityBundle(),
            new \Symfony\Bundle\MonologBundle\MonologBundle(),
            new \Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new \Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),
            new \Symfony\Bundle\TwigBundle\TwigBundle(),
            new \FOS\RestBundle\FOSRestBundle(),
            new \JMS\SerializerBundle\JMSSerializerBundle(),
            new \Nelmio\CorsBundle\NelmioCorsBundle(),
            new \Stof\DoctrineExtensionsBundle\StofDoctrineExtensionsBundle(),
            new \Lexik\Bundle\JWTAuthenticationBundle\LexikJWTAuthenticationBundle(),
            new \WyndApi\WyndApiCoreBundle\WyndApiCoreBundle(),
            new \WyndApi\WyndApiDescriptorBundle\WyndApiDescriptorBundle(),
            new ApiBundle\ApiBundle(),
            new \WyndApi\WyndBookingApiBundle\WyndBookingApiBundle(),
            new \Wynd\WyndApiPosBundle\WyndApiPosBundle(),
            new \FOS\ElasticaBundle\FOSElasticaBundle(),
            new \Knp\Bundle\PaginatorBundle\KnpPaginatorBundle(),
            new \Symfony\Bundle\WebProfilerBundle\WebProfilerBundle(),
            new \ActiveLAMP\Bundle\SwaggerUIBundle\ALSwaggerUIBundle(),
            new Lexik\Bundle\MaintenanceBundle\LexikMaintenanceBundle(),
            new \Doctrine\Bundle\MigrationsBundle\DoctrineMigrationsBundle(),


        ];
        if (in_array($this->getEnvironment(), ['dev', 'test'], true)) {
            $bundles[] = new \Doctrine\Bundle\DoctrineCacheBundle\DoctrineCacheBundle();
            $bundles[] = new \Hautelook\AliceBundle\HautelookAliceBundle();

        }

        return $bundles;
    }

    public function getRootDir()
    {
        return __DIR__;
    }

    public function getCacheDir()
    {
        return dirname(__DIR__).'/var/cache/'.$this->environment;
    }

    public function getLogDir()
    {
        return dirname(__DIR__).'/var/logs';
    }

    protected function configureRoutes(RouteCollectionBuilder $routes)
    {
        if ($this->getEnvironment() !== 'prod') {
            $routes->mount('/', $routes->import(__DIR__.'/config/routing_dev.yml'));
        } else {
            $routes->mount('/', $routes->import(__DIR__.'/config/routing.yml'));
        }
    }

    protected function configureContainer(ContainerBuilder $c, LoaderInterface $loader)
    {
        $loader->load(__DIR__.'/config/config_'.$this->getEnvironment().'.yml');
    }
}
