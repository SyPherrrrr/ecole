-- Création Tables --

-- DROPS pour supprimer les table --
DROP TABLE PRISE_POTION;
DROP TABLE COMPOSITION;
DROP TABLE PATIENT;
DROP TABLE CompositionIngrédient;
DROP TABLE POTION;
DROP TABLE INGREDIENT;


-- Table Patient --
CREATE TABLE PATIENT(
    nomPatient VARCHAR(50),
    prenom VARCHAR(50),
    sexe VARCHAR(1),
    age INT,
    profession VARCHAR(50),
    village VARCHAR(50),
    nationalite VARCHAR(50),
    PRIMARY KEY (nomPatient)
);

-- Table Potion --
CREATE TABLE POTION(
    nomPotion VARCHAR(50),
    origine VARCHAR(50),
    druideCreateur VARCHAR(50),
    genre VARCHAR(50),
    dateCreation DATE,
    posologie INT,
    PRIMARY KEY (nomPotion)
);

-- Prise Potion --
CREATE TABLE PRISE_POTION(
    nomPatient VARCHAR(50),
    nomPotion VARCHAR(50),
    datePrise DATE,
    PRIMARY KEY (nomPatient, nomPotion, datePrise),
    FOREIGN KEY (nomPatient) REFERENCES PATIENT(nomPatient),
    FOREIGN KEY (nomPotion) REFERENCES POTION(nomPotion)
);

-- Ingrédients --
CREATE TABLE INGREDIENT(
    nomIngredient VARCHAR(50),
    villeOrigine VARCHAR(50),
    type VARCHAR(50),
    PRIMARY KEY (nomIngredient)
);

-- Composition --
CREATE TABLE COMPOSITION (
    nomPotion VARCHAR2(50),
    nomIngredient VARCHAR2(50),
    quantiteUtilisee NUMBER,
    FOREIGN KEY (nomPotion) REFERENCES POTION(nomPotion),
    FOREIGN KEY (nomIngredient) REFERENCES INGREDIENT(nomIngredient),
    PRIMARY KEY (nomPotion, nomIngredient)
);



-- Mise à jour de la table --

    -- Question 1 : . Construire un jeu d’essai permettant de vérifier, lorsque cela est possible, les questions dans
-- la suite du TP --

--PATIENT--
INSERT INTO PATIENT (nomPatient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Smith', 'John', 'M', 45, 'Avocat', 'NAntes', 'Anglais');
INSERT INTO PATIENT (nomPatient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Martin', 'Marie', 'F', 30, 'Infirmière', 'Paris', 'Française');
INSERT INTO PATIENT (nomPatient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Garcia', 'Luis', 'M', 38, 'Ingénieur', 'Barcelone', 'Espagnol');
INSERT INTO PATIENT (nomPatient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Mueller', 'Anna', 'F', 29, 'Scientifique', 'Londres', 'Allemande');
INSERT INTO PATIENT (nomPatient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Kim', 'Ji-hoon', 'M', 32, 'Médecin', 'Séoul', 'Coréen');


--POTION--
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion2', 'Montagne', 'Getafix', 'Magiques', TO_DATE('10-02-2023', 'DD-MM-YYYY'), 3);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion3', 'Plaine', 'Miraculix', 'Curatives', TO_DATE('05-03-2023', 'DD-MM-YYYY'), 1);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion4', 'Marais', 'Gargamel', 'Mystérieux', TO_DATE('20-01-2023', 'DD-MM-YYYY'), 1);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion5', 'Londres', 'Merlin', 'Curatives', TO_DATE('12-04-2023', 'DD-MM-YYYY'), 2);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion6', 'Londres', 'Panoramix', 'Magiques', TO_DATE('03-07-2023', 'DD-MM-YYYY'), 1);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion11', NULL, 'Merlin', 'Magiques', TO_DATE('01-02-2023', 'DD-MM-YYYY'), 2);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion12', NULL, 'Circe', 'Envoûtante', TO_DATE('15-11-2023', 'DD-MM-YYYY'), 1);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion13', 'Bretagne', 'Merlin', 'Magiques', TO_DATE('01-09-2023', 'DD-MM-YYYY'), 2);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion14', 'Bretagne', 'Amnesix', 'Envoûtante', TO_DATE('15-11-2023', 'DD-MM-YYYY'), 1);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion15','Latine','Amnesix', 'Envoûtante', TO_DATE('15-11-2023', 'DD-MM-YYYY'), 10);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion999','Washington','Panoramix', 'Envoûtante', TO_DATE('-0555/01/01','syyyy/mm/dd'), 10);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion111','New-York','Amnésix', 'Envoûtante', TO_DATE('-0555/02/01','syyyy/mm/dd'), 10);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('PotionXYZ','Nantes','Merlin', 'Magiques', TO_DATE('-0555/02/01','syyyy/mm/dd'), 10);


--PRISE_POTION--
INSERT INTO PRISE_POTION (nomPatient, nomPotion, datePrise)
VALUES ('Martin', 'Potion3', TO_DATE('10-03-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nomPatient, nomPotion, datePrise)
VALUES ('Garcia', 'Potion4', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nomPatient, nomPotion, datePrise)
VALUES ('Mueller', 'Potion5', TO_DATE('15-04-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nomPatient, nomPotion, datePrise)
VALUES ('Mueller', 'Potion6', TO_DATE('15-04-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nomPatient, nomPotion, datePrise)
VALUES ('Kim', 'Potion6', TO_DATE('05-07-2023', 'DD-MM-YYYY'));

--INGREDIENT--
INSERT INTO INGREDIENT (nomIngredient, villeOrigine, type)
VALUES ('Feuille de Laurier', 'Athènes', 'Herbe médicinale');
INSERT INTO INGREDIENT (nomIngredient, villeOrigine, type)
VALUES ('Racine de Mandragore', 'Forêt de Brocéliande', 'Plante magique');
INSERT INTO INGREDIENT (nomIngredient, villeOrigine, type)
VALUES ('Serpentardium', 'Amazonie', 'Herbe exotique');
INSERT INTO INGREDIENT (nomIngredient, villeOrigine, type)
VALUES ('Baie de Sureau', 'Cotswolds', 'Plante médicinale');
INSERT INTO INGREDIENT (nomIngredient, villeOrigine, type)
VALUES ('Œil de Trithemius', 'Transylvanie', 'Ingrédient mystique');


--COMPOSITION--
INSERT INTO COMPOSITION (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('Potion2', 'Feuille de Laurier', 2);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('Potion3', 'Racine de Mandragore', 1);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('Potion4', 'Serpentardium', 3);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('Potion5', 'Racine de Mandragore', 2);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('Potion6', 'Baie de Sureau', 2);

select * from PATIENT;
select * from POTION;
select * from PRISE_POTION;
select * from INGREDIENT;
select * from COMPOSITION;

-- Contrainte d'intégrité --
-- question 1 --
-- Création de la table CompositionIngrédient
CREATE TABLE CompositionIngrédient (
    nomIngredient VARCHAR(50),
    nomSousIngredient VARCHAR(50),
    quantitéUtilisée INT,

    -- Clé primaire composée
    PRIMARY KEY (nomIngredient),

    -- Clé étrangère
    FOREIGN KEY (nomIngredient) REFERENCES INGREDIENT(nomIngredient),

    -- Contrainte : Un ingrédient ne peut pas être composé de plus de 5 ingrédients
    CHECK (quantitéUtilisée <= 5)
);


-- Composition des sous ingrédients dans les ingrédients  --
-- les ingrédients doivent correspondre car clé étrangère --

-- Composition des ingrédients dans les potions --
-- Les potions et les ingrédients doivent correspondre car clés étrangères --

INSERT INTO CompositionIngrédient (nomIngredient, nomSousIngredient, quantitéUtilisée)
VALUES ('Feuille de Laurier', 'SousIng1', 2);

INSERT INTO CompositionIngrédient (nomIngredient, nomSousIngredient, quantitéUtilisée)
VALUES ('Racine de Mandragore', 'SousIng2', 1);

INSERT INTO CompositionIngrédient (nomIngredient, nomSousIngredient, quantitéUtilisée)
VALUES ('Serpentardium', 'SousIng3', 3);

INSERT INTO CompositionIngrédient (nomIngredient, nomSousIngredient, quantitéUtilisée)
VALUES ('Baie de Sureau', 'SousIng4', 2);

INSERT INTO CompositionIngrédient (nomIngredient, nomSousIngredient, quantitéUtilisée)
VALUES ('Œil de Trithemius', 'SousIng5', 1);



select *
from CompositionIngrédient;

-- Clé primaire --
-- question 1 --

-- Création d'une séquence pour l'auto-incrémentation --
-- une séquence permet de prendre des valeurs (ici à partir de 1 et en augmentant de 1) --
CREATE SEQUENCE seq_noPotion START WITH 1 INCREMENT BY 1;

-- Modification de la table Potion pour ajouter l'identifiant auto-incrémenté --
-- ALTER TABLE permet de modifier/ajouter/supprimer des colonnes/clés d'une table --
-- Par défault noPotion aura une valeur de la sequence --
ALTER TABLE POTION
ADD noPotion INT DEFAULT seq_noPotion.NEXTVAL;

-- test --
-- Utilisation de la séquence pour les nouvelles insertions
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion1000000', 'Nouvelle Origine', 'Nouveau Druide', 'Nouveau Genre', SYSDATE, 5);

select * from POTION;


-- Attribut calculé --
-- question 1 --
-- Ajouter la colonne nbIngrédients dans la table POTION
ALTER TABLE POTION
ADD nbIngrédients INT default 0;




SELECT * FROM POTION;
select  * from CompositionIngrédient;

-- question 2 --
-- Procédure ( sans return ) et fonction (avec return) --
-- potion_rec est une variable de type enregistrement (elle prend la valeur d'une ligne)--
CREATE OR REPLACE PROCEDURE UpdateNbIngredients IS
BEGIN
    FOR potion_rec IN (SELECT DISTINCT * FROM POTION) LOOP
        -- On récupère le nombre d'ingrédients
        update POTION
        set nbIngrédients = (select count(*) from COMPOSITION where nomPotion = potion_rec.nomPotion)
        where nomPotion = potion_rec.nomPotion;
    END LOOP;
END;

-- test --
call UpdateNbIngredients();
select * from POTION;
select *
from COMPOSITION;


-- question 3 -- Revoir car marche pas
CREATE OR REPLACE TRIGGER UpdateNbIngredientTrigger
AFTER INSERT OR UPDATE ON COMPOSITION
FOR EACH ROW
BEGIN
    UpdateNbIngredients(:NEW.nomPotion, :NEW.nomIngredient, :new.quantiteUtilisee);
END UpdateNbIngredientTrigger;
/
drop trigger UPDATENBINGREDIENTTRIGGER;

-- test --
select * from POTION;
INSERT INTO Composition (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('PotionXYZ', 'Feuille de Laurier', 1);
delete from COMPOSITION where nomPotion='PotionXYZ';

select * from POTION;


-- partie 4 : Vues --
-- fournir une représentation structurée des données présentes dans une ou plusieurs tables --
-- question 1 --

create view VuePotionsIngredients as
select C.nomPotion,C.nomIngredient from COMPOSITION C JOIN POTION P ON C.nomPotion = P.nomPotion;
-- test --
select * from VuePotionsIngredients;

-- question 2 --
-- Récuperer les noms des potions qui ont plus de 3 ingrédients -> les supprimer de la vue --
delete from VuePotionsIngredients
WHERE nomPotion IN (
    SELECT nomPotion
    FROM VuePotionsIngredients
    GROUP BY nomPotion
    HAVING COUNT(DISTINCT nomIngredient) > 3
);

-- test --
INSERT INTO Composition (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('PotionXYZ', 'Serpentardium', 1);
INSERT INTO Composition (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('PotionXYZ', 'Racine de Mandragore', 1);
INSERT INTO Composition (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('PotionXYZ', 'Baie de Sureau', 1);
INSERT INTO Composition (nomPotion, nomIngredient, quantiteUtilisee)
VALUES ('PotionXYZ', 'Feuille de Laurier', 1);
select * from VuePotionsIngredients;



-- Partie 5 --
-- question 1 --
-- pb de violation de contrainte --
INSERT INTO CompositionIngrédient (nomIngredient, nomSousIngredient, quantitéUtilisée)
VALUES ('Feuille de Laurier', 'Racine de Mandragore',1);
INSERT INTO CompositionIngrédient (nomIngredient, nomSousIngredient, quantitéUtilisée)
VALUES ('Racine de Mandragore', 'Serpentardium', 1);
INSERT INTO CompositionIngrédient (nomIngredient, nomSousIngredient, quantitéUtilisée)
VALUES ('Racine de Mandragore', 'Baie de Sureau', 1);

select
CI.nomIngredient, CI.nomSousIngredient
from CompositionIngrédient CI
start with CI.nomIngredient = 'Feuille de Laurier'
connect by CI.nomIngredient = CI.nomSousIngredient;

-- question 2 --
-- inverser --
select
CI.nomIngredient, CI.nomSousIngredient
from CompositionIngrédient CI
start with CI.nomIngredient = 'Feuille de Laurier'
connect by CI.nomSousIngredient = CI.nomIngredient;


-- chapitre 3 --
-- 1. CONSULTER LE DICTIONNAIRE DES DONNÉES --
--1.1. username --
SELECT username FROM all_users;

--1.2. privilèges systeme des users --
SELECT grantee, privilege FROM dba_sys_privs
WHERE grantee IN (SELECT username FROM all_users);

-- bible --
SELECT * FROM dba_sys_privs;

--1.3. roles prédéfinis --
SELECT role FROM dba_roles;


--1.4. users avec ces roles et les users qui ont octroayé le role --
-- REVOIR OU DMD A QQL --
SELECT grantee, granted_role, admin_option
FROM dba_role_privs;


--1.5. quotas de chaque utilisateur --
SELECT username, tablespace_name, bytes, max_bytes, max_blocks
FROM dba_ts_quotas;


-- 2. GESTION DES UTILISATEURS --
-- question 1 --
create user sypher identified by sypher;

--test--
select *
from all_users where username='SYPHER';

-- question 2 : se connecter au user créé --
-- cest ce que la prof nous a donné mais ça ne marche pas --
grant connect to SYPHER;
grant create session to SYPHER;
grant restricted session to SYPHER;


-- question 3 : donner le droit de créer des tables au user créé --
grant create table to SYPHER;


-- question 4 : se connecter en tant que panoramix et créer une table
-- Je me suis connecté manuellement en haut à droite --
create table table1(
    info1 varchar(50),
    info2 varchar(50)
);

-- Atriution du même espace de travail pour le user panoramix --
ALTER USER SYPHER
DEFAULT TABLESPACE USERS
QUOTA 20K ON USERS;

-- test --
SELECT username, DEFAULT_TABLESPACE
FROM DBA_USERS
WHERE USERNAME = 'E219118X' or USERNAME = 'SYPHER';



-- question 5 : se connecter en tant que panoramix, créer une table test
create table test(
    id number,
    nom varchar(15)
);

grant select on test to public;
-- Verif --
select table_name from all_tables where owner='SYPHER';
select grantee, privilege from all_tab_privs where table_name='TEST';

-- question 6 : PAS COMPRIS LA QUESTION

-- 3. NOTION DE ROLE --
-- 3.1. créer un role avec des privilèges --
create role E219118XRoleIndex;
grant create any index to E219118XRoleIndex;
grant alter any index to E219118XRoleIndex;
grant drop any index to E219118XRoleIndex;
grant E219118XRoleIndex to SYPHER;
-- verif --
select grantee, granted_role from dba_role_privs where grantee='SYPHER';

-- 3.2. Créer un autre role --
create role role1;
grant grant any privilege to role1;
grant role1 to SYPHER;
-- verif --
select grantee, granted_role from dba_role_privs where grantee='SYPHER';

-- 3.3. Verif des privilège en tant que user Sypher --
-- verif d'au dessus --

-- 3.4. Faire le menage --
revoke all privileges from SYPHER;
drop user SYPHER cascade;



