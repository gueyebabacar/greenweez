<?php
namespace ApiBundle\DependencyInjection\Compiler;

use ApiBundle\EventListener\OrderEventListener;
use ApiBundle\Manager\BasketManager;
use ApiBundle\Manager\DiscountManager;
use ApiBundle\Service\Mailer;
use ApiBundle\Service\Order;
use Symfony\Component\DependencyInjection\Compiler\CompilerPassInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;

class OverrideServiceCompilerPass implements CompilerPassInterface
{
    /**
     * You can modify the container here before it is dumped to PHP code.
     *
     * @param ContainerBuilder $container
     */
    public function process(ContainerBuilder $container)
    {
//        $container->getDefinition('wynd.mailer')->setClass(Mailer::class);
//        $container->getDefinition('api.discount_manager')->setClass(DiscountManager::class);
//        $container->getDefinition('wynd.mailer')->addMethodCall('setHeaderLogo', [
//            $container->getParameter('email_header_logo')
//        ]);
//
//        $container->getDefinition('wynd.mailer')->addMethodCall('setFooterLogo', [
//            $container->getParameter('email_footer_logo')
//        ]);
//
//        $container->getDefinition('wynd.mailer')->addMethodCall('setQrCodeFactory', [
//            $container->getDefinition('endroid.qrcode.factory')
//        ]);
//
//        $container->getDefinition('app.order.status.listener')->setClass(OrderEventListener::class)
//                                                              ->addMethodCall('setTicketService', [
//                                                                    $container->getDefinition('jumble.ticket')
//                                                                ]);
//
//        $container->getDefinition('app.order_service')->setClass(Order::class);
//
//        $container->getDefinition('api.basket_manager')->setClass(BasketManager::class);
    }
}
