-- Base de données --

Create table Etudiant (
    Numéro       INT auto_increment,
    Nom      VARCHAR(255),
    Prénom   VARCHAR(255),
    Identifiant   VARCHAR(255),
    Password VARCHAR(255),
    Classe   VARCHAR(255),
    Primary key (Numéro)
);

Create table Cours(
    Numéro int auto_increment,
    Intitulié VARCHAR(255),
    Date_ DATE,
    Heure_debut TIME,
    Heure_fin TIME,
    Numéro_enseignant int,
    PRIMARY KEY (Numéro),
    FOREIGN KEY (Numéro_enseignant) references Enseignant(Numéro)
);

CREATE table Enseignant(
    Numéro int auto_increment,
    Nom VARCHAR(255),
    Prénom VARCHAR(255),
    Identifiant VARCHAR(255),
    Password VARCHAR(255),
    PRIMARY KEY (Numéro)
);

CREATE TABLE Secretaire (
    Numéro INT  AUTO_INCREMENT,
    Identifiant CHAR(255) NOT NULL,
    Mot_de_passe CHAR(255) NOT NULL,
    PRIMARY KEY (Numéro)
);

CREATE TABLE Absence (
    Numéro INT AUTO_INCREMENT,
    Numéro_Eleve INT,
    Numéro_Enseignant INT,
    Numéro_Cours INT,
    Numéro_Secretaire INT,
    Justifié BOOLEAN,
    attribute8 INT,
    Primary Key (Numéro),
    FOREIGN KEY (Numéro_Eleve) REFERENCES Etudiant(Numéro),
    FOREIGN KEY (Numéro_Enseignant) REFERENCES Enseignant(Numéro),
    FOREIGN KEY (Numéro_Cours) REFERENCES Cours(Numéro),
    FOREIGN KEY (Numéro_Secretaire) REFERENCES Secretaire(Numéro)
);

CREATE TABLE Justificatif (
    Numéro_Absence INT,
    Motif CHAR(255),
    Document_Justificatif CHAR(255),
    PRIMARY KEY (Numéro_Absence),
    FOREIGN KEY (Numéro_Absence) REFERENCES Absence(Numéro)
);

CREATE TABLE Rapport_Semestriel (
    Numéro INT AUTO_INCREMENT,
    Numéro_Eleve INT,
    Numéro_Secretaire INT,
    Contenu CHAR(255),
    PRIMARY KEY (Numéro),
    FOREIGN KEY (Numéro_Eleve) REFERENCES Etudiant(Numéro),
    FOREIGN KEY (Numéro_Secretaire) REFERENCES Secretaire(Numéro)
);






