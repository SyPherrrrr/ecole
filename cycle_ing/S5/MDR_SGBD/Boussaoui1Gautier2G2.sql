-- DROP TABLE --
drop table PRISE_POTION;
drop table COMPOSITION;
drop table PATIENT;
drop table POTION;
drop table COMPOSITIONINGREDIENT;
drop table INGREDIENT;
drop view potion_and_ingredient;

-- Création de la table PATIENT
CREATE TABLE PATIENT (
    nom_Patient VARCHAR2(50) PRIMARY KEY,
    prenom VARCHAR2(50),
    sexe CHAR(1),
    age NUMBER,
    profession VARCHAR2(100),
    village VARCHAR2(100),
    nationalite VARCHAR2(50)
);

-- Création de la table POTION
CREATE TABLE POTION (
    noPotion NUMBER GENERATED ALWAYS AS IDENTITY,
    nomPotion VARCHAR2(50) PRIMARY KEY,
    Origine VARCHAR2(100),
    druideCreateur VARCHAR2(50),
    genre VARCHAR2(50),
    dateCreation DATE,
    posologie NUMBER,
    nbIngredient NUMBER
);

-- Création de la table PRISE-POTION
CREATE TABLE PRISE_POTION (
    nom_Patient VARCHAR2(50),
    nomPotion VARCHAR2(50),
    date_prise DATE,
    PRIMARY KEY (nom_Patient, nomPotion, date_prise),
    FOREIGN KEY (nom_Patient) REFERENCES PATIENT(nom_Patient),
    FOREIGN KEY (nomPotion) REFERENCES POTION(nomPotion)
);

-- Création de la table INGREDIENT
CREATE TABLE INGREDIENT (
    nomIngredient VARCHAR2(50) PRIMARY KEY,
    villeOrigine VARCHAR2(100),
    type VARCHAR2(50)
);

-- Création de la table COMPOSITION
CREATE TABLE COMPOSITION (
    nomPotion VARCHAR2(50),
    nomIngredient VARCHAR2(50),
    QuantiteUtilise NUMBER,
    FOREIGN KEY (nomPotion) REFERENCES POTION(nomPotion),
    FOREIGN KEY (nomIngredient) REFERENCES INGREDIENT(nomIngredient),
    PRIMARY KEY (nomPotion, nomIngredient)
);

-- Question 1.1 : Créer la table CompositionIngrédient et implémenter ces contraintes dans la base de données --
CREATE TABLE COMPOSITIONINGREDIENT (
    nomIngredient     VARCHAR2(50),
    nomSousIngredient VARCHAR2(100),
    quantiteUtilise   NUMBER,
    PRIMARY KEY (nomIngredient, nomSousIngredient),
    FOREIGN KEY (nomIngredient) REFERENCES INGREDIENT (nomIngredient),
    CONSTRAINT maxQte CHECK ( quantiteUtilise <= 5 ),
    CONSTRAINT ingredientDifferent check ( nomSousIngredient <> nomIngredient ));

--- MISE A JOUR DE LA BASE ---

--PATIENT--
INSERT INTO PATIENT (nom_Patient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Smith', 'John', 'M', 45, 'Avocat', 'NAntes', 'Anglais');
INSERT INTO PATIENT (nom_Patient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Martin', 'Marie', 'F', 30, 'Infirmière', 'Paris', 'Française');
INSERT INTO PATIENT (nom_Patient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Garcia', 'Luis', 'M', 38, 'Ingénieur', 'Barcelone', 'Espagnol');
INSERT INTO PATIENT (nom_Patient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Mueller', 'Anna', 'F', 29, 'Scientifique', 'Londres', 'Allemande');
INSERT INTO PATIENT (nom_Patient, prenom, sexe, age, profession, village, nationalite)
VALUES ('Kim', 'Ji-hoon', 'M', 32, 'Médecin', 'Séoul', 'Coréen');

--POTION--
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion2', 'Montagne', 'Getafix', 'Magiques', TO_DATE('10-02-2023', 'DD-MM-YYYY'), 3);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion3', 'Plaine', 'Miraculix', 'Curatives', TO_DATE('05-03-2023', 'DD-MM-YYYY'), 1);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion4', 'Marais', 'Merlin', 'Mystérieux', TO_DATE('20-01-2023', 'DD-MM-YYYY'), 1);
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


--PRISE_POTION--
INSERT INTO PRISE_POTION (nom_Patient, nomPotion, date_prise)
VALUES ('Smith', 'Potion2', TO_DATE('20-02-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nom_Patient, nomPotion, date_prise)
VALUES ('Martin', 'Potion3', TO_DATE('10-03-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nom_Patient, nomPotion, date_prise)
VALUES ('Garcia', 'Potion4', TO_DATE('02-02-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nom_Patient, nomPotion, date_prise)
VALUES ('Mueller', 'Potion5', TO_DATE('15-04-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nom_Patient, nomPotion, date_prise)
VALUES ('Mueller', 'Potion6', TO_DATE('15-04-2023', 'DD-MM-YYYY'));
INSERT INTO PRISE_POTION (nom_Patient, nomPotion, date_prise)
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
INSERT INTO COMPOSITION (nomPotion, nomIngredient, QuantiteUtilise)
VALUES ('Potion2', 'Feuille de Laurier', 2);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, QuantiteUtilise)
VALUES ('Potion2', 'Racine de Mandragore', 2);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, QuantiteUtilise)
VALUES ('Potion3', 'Racine de Mandragore', 1);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, QuantiteUtilise)
VALUES ('Potion4', 'Serpentardium', 3);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, QuantiteUtilise)
VALUES ('Potion5', 'Racine de Mandragore', 2);
INSERT INTO COMPOSITION (nomPotion, nomIngredient, QuantiteUtilise)
VALUES ('Potion6', 'Baie de Sureau', 2);

INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES ('Feuille de Laurier', 'Herbe', 2);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES ('Racine de Mandragore', 'Arbre', 1);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES ('Serpentardium', 'Ecaille', 3);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES ('Baie de Sureau', 'Fruit', 2);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES ('Serpentardium', 'Venin', 4);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES('Œil de Trithemius', 'Pupille', 1);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES('Feuille de Laurier', 'Branche', 1);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES ('Baie de Sureau', 'Baguette', 1);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES ('Baie de Sureau', 'Feuille de Laurier', 1);
INSERT INTO CompositionIngredient (nomIngredient, nomSousIngredient, QuantiteUtilise)
VALUES ('Serpentardium', 'Baie de Sureau', 1);

------------------------------ CHAPITRE 2 ----------------------------------

-- Question 2.1 : Réaliser l’incrémentation de l’identifiant --
-- Création d'une séquence pour l'auto-incrémentation --
-- une séquence permet de prendre des valeurs (ici à partir de 1 et en augmentant de 1) --
CREATE SEQUENCE seq_noPotion START WITH 1 INCREMENT BY 1;

-- Modification de la table Potion pour ajouter l'identifiant auto-incrémenté --
-- Par défault noPotion aura une valeur de la sequence --
ALTER TABLE POTION
ADD noPotion INT DEFAULT seq_noPotion.NEXTVAL;


-- Question 3.1 : Rajouter à la table de votre choix une colonne nbIngrédients qui compte (”automatiquement” )
-- le nombre d’ingrédients composant une potion. --

alter table POTION add nbIngrédients int;

-- Question 3.2 : Ecrire une procédure stockée permettant de renseigner la colonne nbingrédients
-- pour les tuples déjà présents dans la base. --

CREATE OR REPLACE PROCEDURE UpdateNbIngredients AS
BEGIN
    FOR potion_rec IN (SELECT DISTINCT * FROM POTION) LOOP
        update POTION
        set nbIngrédients = (select count(*) from COMPOSITION where nomPotion = potion_rec.nomPotion)
        where nomPotion = potion_rec.nomPotion;
    END LOOP;
END;

-- Question 3.3 : Ecrire un trigger permettant de mettre à jour automatiquement
-- cette colonne lors des nouvelles mises à jour de la base.

CREATE OR REPLACE TRIGGER nbIngrédientPotion
BEFORE INSERT OR UPDATE
ON POTION
FOR EACH ROW
    DECLARE
    v_nbIngrédient NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_nbIngrédient
    FROM COMPOSITION c
    WHERE c.nomPotion = :NEW.nomPotion;

    :NEW.nbIngredient := v_nbIngrédient;
END;

-- Question 4.1 : Définir une vue permettant de consulter tous les renseignements sur
-- les potions et leurs ingrédients --

Create or replace view VuePotionsIngredients as
select * from COMPOSITION C JOIN POTION P ON C.nomPotion = P.nomPotion;

select * from potion_and_ingredient;

-- Question 4.2 : Supprimer à partir de cette vue les potions comptant plus de trois ingrédients --
DELETE FROM VuePotionsIngredients
WHERE nomPotion IN (
    SELECT nomPotion
    FROM VuePotionsIngredients
    GROUP BY nomPotion
    HAVING COUNT(DISTINCT nomIngredient) > 3
);


-- Question 5.1 : Lister pour un ingrédient donné tous les ingrédients directs et indirects qui le composent. --
SELECT distinct
  CI.nomIngredient AS ingredient,
  CI.nomSousIngredient AS sousIngredient,
  LEVEL AS hierarchy_level
FROM
  CompositionIngredient CI, INGREDIENT i
START WITH
  CI.nomIngredient = 'Baie de Sureau'
CONNECT BY
  PRIOR CI.nomSousIngredient = CI.nomIngredient
ORDER BY
  hierarchy_level, sousIngredient;

-- Question 5.2 : Lister pour un ingrédient donné, les ingrédients dans
-- lesquelles il intervient directement ou indirectement. --
SELECT
    ci.nomSousIngredient as sousIngredient,
    ci.nomIngredient as ingredient,
    LEVEL as hierarchy_level
FROM
    COMPOSITIONINGREDIENT ci
START WITH
    ci.nomSousIngredient = 'Feuille de Laurier'
CONNECT BY
    PRIOR ci.nomIngredient = ci.nomSousIngredient
ORDER BY
    hierarchy_level, ingredient;

------------------------------ CHAPITRE 3 ----------------------------------

-- Question 1.1 : Quels sont les utilisateurs existants dans la base ? --
SELECT username FROM all_users;

-- Question 1.2 : Quels sont les privilèges systèmes ? --
SELECT grantee, privilege FROM dba_sys_privs
WHERE grantee IN (SELECT username FROM all_users);

-- Question 1.3 : Quels sont les rôles prédéfinis ? --
select distinct granted_role from dba_role_privs where default_role='YES';

-- Question 1.4 : Quels sont les utilisateurs qui ont ces rôles et qui les leur aa octroyé ?  --
select dba_role.grantee, dba_role.granted_role, dba_tabs.grantor
from dba_role_privs dba_role join dba_tab_privs dba_tabs
    on dba_role.grantee = dba_tabs.grantee where dba_role.default_role='YES';

-- Question 1.5 : Quels sont les quotas de chaque utilisateur ? --
SELECT username, tablespace_name, bytes, max_bytes, max_blocks
FROM dba_ts_quotas;

-- Question 2.1 : créer un utilisateur E0XXXXPANORAMIX --
create user E219118XPANORAMIX identified by E219118XPANORAMIX;

-- Question 2.2 : Se connecter sous le nom de E0XXXXPANORAMIX --
-- Connection manuelle sur l'interface était utilisée --
grant create session to E219118XPANORAMIX;
grant restricted session to E219118XPANORAMIX;

-- Question 2.3 : En tant qu’administrateur, donner le droit de créer des tables à PANORAMIX. --
grant create table to E219118XPANORAMIX;

/* Changement manuellement de user à E219118XPANORAMIX */
create table test(id int primary key );

-- Question 2.4 : Se connecter en tant que PANORAMIX et tenter de créer une table.
-- En tant qu’administrateur, affecter à PANORAMIX votre espace de travail comme espace de travail par défaut en
-- limitant à 20K la taille de l’espace utilisable, vérifier les résultats. --
alter user E219118XPANORAMIX default tablespace USERS quota 20K on USERS;

-- Question 2.5 :  Se connecter en tant que PANORAMIX, créer une table Test et donner les droits d’interrogation sur
-- cette table à tout utilisateur. Si la création échoue, expliquer pourquoi et corriger puis vérifier. --
/* Changement de user à E219118XPANORAMIX */
create table test(
    id number,
    nom varchar(15)
);

grant select on test to public;

-- verification en changeant d'utilisateur --
select table_name from all_tables where owner='PANORAMIX';

-- Question 2.6 : Permettre à PANORAMIX de ne consulter que les potions dont il est l’émetteur ou le récepteur. --
create or replace view PotionPanoramix as
    select * from POTION po, PRISE_POTION pp
             where po.nomPotion = pp.nomPotion
               and (po.druideCreateur = 'Panoramix'
                        or pp.nomPatient='Panoramix');

grant select on PotionPanoramix to E219118XPANORAMIX;

-- Question 3.1 : Créer un rôle E219118XRoleIndex ayant comme privilèges create ans index,
-- alter any index, drop ana index. Allouer ce rôle à E219118XPANORAMIX. --
create role E219118XRoleIndex;
grant create any index to E219118XRoleIndex;
grant alter any index to E219118XRoleIndex;
grant drop any index to E219118XRoleIndex;
grant E219118XRoleIndex to E219118XPANORAMIX;

-- Question 3.2 : Créer un rôle Role1 ayant Grant any privilege comme privilèges. --
Create role role1;
grant grant any privilege to role1;
grant role1 to PANORAMIX;


-- Question 3.3 : En tant qu’utilisateur PANORAMIX, vérifiez ses privilèges (Connect to)
-- Alternative pour verifier, car j'arrive pas à me connecter--
select grantee, granted_role from dba_role_privs where grantee='PANORAMIX';

-- Possibilité de se connecter à l'utilisateur Panoramix
-- et tester de créer une table par exemple --

-- Question 3.4 : Faire le ménage : supprimer tous les objets créés
-- (utilisateurs, tables, rôles etc). Voir entre autres, drop user … cascade. --
revoke all privilges from E219118XPANORAMIX;
drop user E219118XPANORAMIX cascade;
drop role E219118XRoleIndex;
drop role role1;



------------------------------ CHAPITRE 4 ----------------------------------

select * from dba_tablespaces;

select * from dba_data_files;

select * from all_tables;

select * from ALL_TAB_COLUMNS where table_name = 'PATIENT';

select * from DBA_TAB_COMMENTS where table_name = 'PATIENT';

select * from DBA_COL_COMMENTS where table_name = 'PATIENT' and owner = 'E217657J';

-- Question 4.1 --

SELECT ROWNUM as numero_ordre,
       nom_Patient,
       prenom
FROM PATIENT;

SELECT *
FROM dba_data_files df
JOIN dba_tables t ON df.tablespace_name = t.tablespace_name
WHERE t.table_name = 'PATIENT';

select * from dba_data_files;

-- Question 4.2 --

-- TABLESPACE = USERS ;
-- Dans quel table space est elle stocké
SELECT table_name, tablespace_name, owner
FROM all_tables
WHERE table_name = 'PATIENT';

-- Danq quel fichier physique
SELECT tablespace_name, file_name
FROM dba_data_files
WHERE tablespace_name = 'USERS';


-- Question 4.3 --

SELECT segment_name, sum(bytes) as nb_octet, SUM(blocks) as nb_block
FROM dba_segments
WHERE segment_name = 'PATIENT'
    or segment_name = 'COMPOSITION'
    or segment_name = 'COMPOSITIONINGREDIENT'
    or segment_name = 'POTION'
    or segment_name = 'INGREDIENT'
group by segment_name;


SELECT
TABLESPACE_NAME AS "TABLESPACE",
SEGMENT_TYPE AS "TYPE OBJET",
Sum(BYTES) / 1024 / 1024 AS "TAILLE (Mb)"
FROM DBA_EXTENTS
WHERE OWNER = USER
GROUP BY OWNER, TABLESPACE_NAME, SEGMENT_TYPE
ORDER BY OWNER, TABLESPACE_NAME

--- La requête fournit une vue agrégée de l'utilisation de l'espace disque par les objets (tables, indexes, etc.)
-- pour l'utilisateur courant, en présentant la taille totale en mégaoctets pour chaque type d'objet dans chaque tablespace.




