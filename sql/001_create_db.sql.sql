-- Création de la base de données
DROP DATABASE IF EXISTS gestion_etudiants_pdo;
CREATE DATABASE gestion_etudiants_pdo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gestion_etudiants_pdo;

-- Table filiere
CREATE TABLE filiere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(16) NOT NULL,
    libelle VARCHAR(100) NOT NULL,
    CONSTRAINT uq_filiere_code UNIQUE (code),
    INDEX idx_code (code)
) ENGINE=InnoDB;

-- Table etudiant
CREATE TABLE etudiant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cne VARCHAR(20) NOT NULL,
    nom VARCHAR(80) NOT NULL,
    prenom VARCHAR(80) NOT NULL,
    email VARCHAR(120) NOT NULL,
    filiere_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_etudiant_filiere FOREIGN KEY (filiere_id) 
        REFERENCES filiere(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT uq_etudiant_cne UNIQUE (cne),
    CONSTRAINT uq_etudiant_email UNIQUE (email),
    INDEX idx_nom (nom, prenom),
    INDEX idx_email (email)
) ENGINE=InnoDB;

-- Données de démonstration
INSERT INTO filiere (code, libelle) VALUES
('INFO', 'Informatique'),
('MATH', 'Mathématiques'),
('PHY', 'Physique'),
('CHIM', 'Chimie'),
('BIO', 'Biologie');

INSERT INTO etudiant (cne, nom, prenom, email, filiere_id) VALUES
('CNE000001', 'Durand', 'Alice', 'alice.durand@example.com', 1),
('CNE000002', 'Martin', 'Bob', 'bob.martin@example.com', 1),
('CNE000003', 'Petit', 'Claire', 'claire.petit@example.com', 2),
('CNE000004', 'Bernard', 'David', 'david.bernard@example.com', 3),
('CNE000005', 'Robert', 'Emma', 'emma.robert@example.com', 4);