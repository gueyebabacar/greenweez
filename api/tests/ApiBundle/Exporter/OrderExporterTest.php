<?php

namespace Tests\ApiBundle\Exporter;

use ApiBundle\Exporter\OrderExporter;
use Psr\Log\NullLogger;

class OrderExporterTest extends \PHPUnit_Framework_TestCase
{
    const EXPORT_DIR_TEST = 'var/test/export/order/';
    const EXAMPLE_EXPORT_FILE = 'tests/fixtures/export_order_example.FCT';
    const PREFIX_FILENAME = '20171030';
    const SHORT_DATE = '71030';

    protected $exportDirTest;
    protected $exampleExportFile;

    public static function setUpBeforeClass()
    {
        if (!file_exists(self::EXPORT_DIR_TEST)) {
            mkdir(self::EXPORT_DIR_TEST, 0777, true);
        }
    }

    public function setUp()
    {
        $files = glob(self::EXPORT_DIR_TEST.'*.FCT');
        foreach ($files as $file) {
            if (is_file($file)) {
                unlink($file);
            }
        }

        $this->exportDirTest = realpath(self::EXPORT_DIR_TEST).'/';
        $this->exampleExportFile = realpath(self::EXAMPLE_EXPORT_FILE);
    }

    public function testExportCall()
    {
        $exporter = $this->getMockBuilder(OrderExporter::class)
            ->disableOriginalConstructor()
            ->setMethods(['buildContent', 'writeExport'])
            ->getMock();

        $exporter
            ->expects($this->exactly(2))
            ->method('writeExport')
            ->withConsecutive([['order1']], [['order2']])
        ;

        $orders = [['order1'], ['order2']];

        $exporter->export($orders);
    }

    public function testExport()
    {
        $exporter = new OrderExporter(new NullLogger(), realpath(self::EXPORT_DIR_TEST));

        $reflectionClass = new \ReflectionClass(OrderExporter::class);

        $reflectionProperty = $reflectionClass->getProperty('prefixFilename');
        $reflectionProperty->setAccessible(true);
        $reflectionProperty->setValue($exporter, self::PREFIX_FILENAME);

        $reflectionProperty = $reflectionClass->getProperty('shortDate');
        $reflectionProperty->setAccessible(true);
        $reflectionProperty->setValue($exporter, self::SHORT_DATE);

        $exporter->export($this->getOrders());

        $this->assertFileExists($this->exportDirTest.self::PREFIX_FILENAME.'001.FCT');
        $this->assertFileExists($this->exportDirTest.self::PREFIX_FILENAME.'002.FCT');
        $this->assertSame(
            file_get_contents($this->exampleExportFile),
            file_get_contents($this->exportDirTest.self::PREFIX_FILENAME.'001.FCT')
        );

        $this->assertEquals(244, strlen(file_get_contents($this->exportDirTest.self::PREFIX_FILENAME.'001.FCT')));
    }

    private function getOrders()
    {
        return [
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
                    ]
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
            [
                'type' => 34,
                'reference' => 456,
                'totalTtc' => 2222,
                'tpv' => 2222,
                'caissiere' => 2222,
                'transactionType' => 2222,
                'createdAt' => new \DateTime('2017-10-29 12:34:56'),
                'entity' => ['id' => 1],
                'id' => 2222,
                'orderNumber' => 222,
                'items' => [
                    [
                        'product' => ['barcode' => 11111],
                        'qty' => 3,
                        'priceTtc' => 12,
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
    }
}
