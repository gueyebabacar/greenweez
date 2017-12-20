<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20171215085934 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // Target
        $this->addSql('CREATE TABLE `llx_certification` ( 
                  `rowid` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
                  `id` INT(11), 
                  `name` varchar(100) NOT NULL, 
                  `image_path` varchar(255) NOT NULL)
                  ENGINE = InnoDB
                  DEFAULT CHARSET=utf8;
                  ');

        $this->addSql('ALTER TABLE `llx_certification` 
                        ADD `product_id` INT NULL,
                        ADD CONSTRAINT `llx_product_id` FOREIGN KEY (`product_id`) REFERENCES `llx_product`(`rowid`);
                    ');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql('DROP TABLE `llx_certification`');
        $this->addSql('ALTER TABLE llx_certification 
                        DROP FOREIGN KEY llx_product_id,
                        DROP `product_id`
                    ');

    }
}
