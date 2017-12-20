<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20171220085250 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // Target
        $this->addSql('CREATE TABLE `llx_rating` ( 
                  `rowid` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
                  `average` DECIMAL NOT NULL, 
                  `count` INT(25) NOT NULL) 
                  ENGINE = InnoDB
                  DEFAULT CHARSET=utf8;
                  ');

        $this->addSql('ALTER TABLE `llx_product`
                        ADD `rating_id` INT NULL,
                        ADD CONSTRAINT `llx_product_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `llx_rating`(`rowid`);
                    ');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql('DROP TABLE `llx_rating`');
        $this->addSql('ALTER TABLE llx_product
                        DROP FOREIGN KEY llx_product_rating_id,
                        DROP `rating_id`
                    ');

    }
}
