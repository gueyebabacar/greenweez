<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20171214101718 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // Target
        $this->addSql('CREATE TABLE `llx_brand` ( 
                  `rowid` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
                  `id` INT(11), 
                  `name` varchar(100) NOT NULL, 
                  `image_path` varchar(255) NOT NULL, 
                  `description` text NOT NULL) 
                  ENGINE = InnoDB
                  DEFAULT CHARSET=utf8;
                  ');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql('DROP TABLE `llx_brand`');

    }
}
