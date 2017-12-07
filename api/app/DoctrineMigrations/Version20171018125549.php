<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

class Version20171018125549 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->addSql('CREATE TABLE `llx_beeper` ( `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, `number` INT NOT NULL, `entity_id` INT NOT NULL, CONSTRAINT `fk_entity` FOREIGN KEY (`entity_id`) REFERENCES `llx_entity`(`rowid`)) ENGINE=InnoDB;');
        $this->addSql('ALTER TABLE `llx_commande` ADD COLUMN `beeper_id` INT DEFAULT NULL;');
        $this->addSql('ALTER TABLE `llx_commande` ADD CONSTRAINT `fk_commande_beeper` FOREIGN KEY (`beeper_id`) REFERENCES `llx_beeper`(`id`) ON UPDATE CASCADE ON DELETE SET NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql('ALTER TABLE `llx_commande` DROP FOREIGN KEY `fk_commande_beeper`');
        $this->addSql('ALTER TABLE `llx_commande` DROP COLUMN `beeper_id`');
        $this->addSql('DROP TABLE `llx_beeper`');
    }
}
