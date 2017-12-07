<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

class Version20171122164612 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->addSql('ALTER TABLE `llx_product` ADD COLUMN `upsell_number` INT DEFAULT NULL;');
        $this->addSql('ALTER TABLE `llx_product` ADD UNIQUE `unique_upsell_index`(`entity`, `upsell_number`);');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql('ALTER TABLE `llx_product` DROP COLUMN `upsell_number`');
        $this->addSql('ALTER TABLE `llx_product` DROP COLUMN `unique_upsell_index`');
    }
}
