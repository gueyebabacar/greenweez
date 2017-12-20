<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20171219085236 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // Target
        $this->addSql('CREATE TABLE `llx_product_certification` ( 
                  id INT(11) NOT NULL AUTO_INCREMENT,
                  product_id INT(11) NOT NULL, 
                  certification_id INT(11) NOT NULL,
                  PRIMARY KEY (id)
                  )');

        $this->addSql('ALTER TABLE `llx_product_certification` 
                    ADD CONSTRAINT `llx_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `llx_product`(`rowid`),
                    ADD CONSTRAINT `llx_product_certification_id` FOREIGN KEY (`certification_id`) REFERENCES `llx_certification`(`rowid`)');
    }


    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql('ALTER TABLE llx_product_certification 
                        DROP FOREIGN KEY llx_product_product_id,
                        DROP `product_id`,
                        DROP FOREIGN KEY llx_product_certification_id,
                        DROP `certification_id`
                    ');
        $this->addSql('DROP TABLE `llx_product_certification`');
    }
}
