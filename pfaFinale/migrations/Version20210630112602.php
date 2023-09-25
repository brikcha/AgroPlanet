<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210630112602 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE plante (id INT AUTO_INCREMENT NOT NULL, categorie_id INT DEFAULT NULL, maladie_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, ville VARCHAR(255) NOT NULL, date_de_creation DATE NOT NULL, position LONGTEXT NOT NULL, image VARCHAR(255) NOT NULL, INDEX IDX_517A6947BCF5E72D (categorie_id), INDEX IDX_517A6947B4B1C397 (maladie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE plante ADD CONSTRAINT FK_517A6947BCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id)');
        $this->addSql('ALTER TABLE plante ADD CONSTRAINT FK_517A6947B4B1C397 FOREIGN KEY (maladie_id) REFERENCES maladie (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE plante');
    }
}
