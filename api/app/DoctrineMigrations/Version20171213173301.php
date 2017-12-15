<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20171213173301 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->addSql('ALTER TABLE `llx_product` ADD COLUMN `code` VARCHAR(128);');
        $this->addSql('ALTER TABLE `llx_product` ADD COLUMN `title` VARCHAR(128);');
        $this->addSql('ALTER TABLE `llx_product` ADD COLUMN `image_path` VARCHAR(128);');
        $this->addSql('ALTER TABLE `llx_product` ADD COLUMN `format` VARCHAR(128);');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql('ALTER TABLE `llx_product` DROP COLUMN `code`');
        $this->addSql('ALTER TABLE `llx_product` DROP COLUMN `title`');
        $this->addSql('ALTER TABLE `llx_product` DROP COLUMN `image_path`');
        $this->addSql('ALTER TABLE `llx_product` DROP COLUMN `format`');

    }
}
