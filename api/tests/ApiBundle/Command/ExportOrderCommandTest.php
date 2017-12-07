<?php

namespace Test\ApiBundle\Command;

use ApiBundle\Command\ExportOrderCommand;
use ApiBundle\Manager\OrderManager;
use Symfony\Bundle\FrameworkBundle\Console\Application;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Symfony\Component\Console\Tester\CommandTester;

class ExportOrderCommandTest extends KernelTestCase
{
    public function testExecute()
    {
        $orders = [
            [
                'type' => 12,
                'reference' => 123,
                'totalTtc' => 11111,
                'tpv' => 11111,
                'caissiere' => 11111,
                'transactionType' => 11111,
                'createdAt' => new \DateTime('2017-10-29 12:34:56'),
                'entity' => ['id' => 1],
                'id' => 11111,
                'orderNumber' => 111,
                'items' => [
                    [
                        'product' => ['barcode' => 11111],
                        'qty' => 3,
                        'priceTtc' => 12,
                        'vatRate' => 19.6,
                    ],
                    [
                        'product' => ['barcode' => 99999],
                        'qty' => 9,
                        'priceTtc' => 3,
                        'vatRate' => 19.6,
                    ],
                ],
                'invoices' => [
                    [
                        'payments' => [
                            [
                                'paymentMethod' => ['paymentConfigs' => [['externalId' => 10]]],
                                'amount' => 123.45,
                            ],
                        ],
                    ],
                ],
            ],
        ];

        $orderManager = $this->getMockBuilder(OrderManager::class)
            ->disableOriginalConstructor()
            ->setMethods(['getOrderExportData'])
            ->getMock();

        $orderManager
            ->expects($this->once())
            ->method('getOrderExportData')
            ->willReturn($orders);

        self::bootKernel();
        self::$kernel->getContainer()->set(OrderManager::class, $orderManager);

        $application = new Application(self::$kernel);

        $application->add(new ExportOrderCommand());

        $command = $application->find('export:orders');
        $commandTester = new CommandTester($command);

        $commandTester->execute([]);

        $this->assertEquals(0, $commandTester->getStatusCode());
    }
}
