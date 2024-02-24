
-- Création Tables --

-- DROPS pour supprimer les table --
DROP TABLE PRISE_POTION;
DROP TABLE COMPOSITION;
DROP TABLE PATIENT;
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

-- Composition --
CREATE TABLE COMPOSITION (
    nomPotion VARCHAR2(50),
    nomIngredient VARCHAR2(50),
    quantiteUtilisee NUMBER,
    FOREIGN KEY (nomPotion) REFERENCES POTION(nomPotion),
    FOREIGN KEY (nomIngredient) REFERENCES INGREDIENT(nomIngredient),
    PRIMARY KEY (nomPotion, nomIngredient)
);

-- Ingrédients --
CREATE TABLE INGREDIENT(
    nomIngredient VARCHAR(50),
    villeOrigine VARCHAR(50),
    type VARCHAR(50),
    PRIMARY KEY (nomIngredient)
);



-- Mise à jour de la table -- Le jeu de données a été obtenu par chatpgt pour des raisons pratiques --

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



-- question 2 : . Supprimer les potions d’origine non définie --
delete from POTION where origine is NULL;


-- question 3 : Modifier l’origine ’Bretagne’ et la remplacer par ’Armorique’ dans la table Potion--
INSERT INTO POTION VALUES ('Potion20', 'Bretagne', 'DruideD', 'Magique', TO_DATE('2022-07-10', 'YYYY-MM-DD'), 7);

update POTION set origine = 'Armorique' where origine = 'Bretagne';



-- Consultation de la base  --



-- question 1 : indiquer l’origine de chaque potion --
select nomPotion,ORIGINE from POTION;



-- question 2 : lister les potions d’origine latine dont la posologie est supérieure à 5g --

select nomPotion, origine, posologie from POTION where origine='Latine' and posologie > 5;



-- question 3 : lister les patients qui consomment au moins deux potions qui ont pour origine leur village --
-- Forme 1 --
SELECT P.nomPatient, P.village, COUNT(PP.nomPotion) AS Potions_Consommees
FROM PATIENT P, PRISE_POTION PP, POTION PO
WHERE P.nomPatient = PP.nomPatient AND PP.nomPotion = PO.nomPotion AND PO.Origine = P.village
GROUP BY P.nomPatient, P.village
HAVING COUNT(PP.nomPotion) >= 2;

-- Forme 2 --
SELECT P.nomPatient, P.village, COUNT(PP.nomPotion) AS Potions_Consommees
FROM PATIENT P
JOIN PRISE_POTION PP ON P.nomPatient = PP.nomPatient
JOIN POTION PO ON PP.nomPotion = PO.nomPotion AND PO.Origine = P.village
GROUP BY P.nomPatient, P.village
HAVING COUNT(PP.nomPotion) >= 2;



-- question 4 : . lister les patients qui ne consomment que des potions créées par ’Panoramix ’ --
-- Forme 1 --
select nomPatient
from PRISE_POTION
INNER JOIN POTION P on PRISE_POTION.nomPotion = P.nomPotion
where druideCreateur='Panoramix' except select nomPatient
from PRISE_POTION INNER JOIN POTION P on PRISE_POTION.nomPotion = P.nomPotion
where druideCreateur!='Panoramix';

-- Forme 2 --
SELECT pp.nomPatient
FROM PRISE_POTION pp
INNER JOIN POTION P ON pp.nomPotion = P.nomPotion
WHERE P.druideCreateur = 'Panoramix' EXCEPT SELECT pp.nomPatient
FROM PRISE_POTION pp
INNER JOIN POTION P ON pp.nomPotion = P.nomPotion
WHERE P.druideCreateur != 'Panoramix';



-- question 5 : lister les patients qui ne consomment pas de potion de genre ’curatives’ ou ’magiques’ --

-- Forme 1 --
select pa.nomPatient, pp.nomPotion, po.genre
from PATIENT pa, PRISE_POTION pp , POTION po
where pa.nomPatient = pp.nomPatient
and pp.nomPotion = po.nomPotion EXCEPT select pa.nomPatient, pp.nomPotion, po.genre
from PATIENT pa, PRISE_POTION pp , POTION po
where pa.nomPatient = pp.nomPatient
and pp.nomPotion = po.nomPotion
and (po.genre = 'Curatives' or po.genre = 'Magiques');

-- Forme 2 --
SELECT pa.nomPatient, pp.nomPotion, po.genre
FROM PATIENT pa
JOIN PRISE_POTION pp ON pa.nomPatient = pp.nomPatient
JOIN POTION po ON pp.nomPotion = po.nomPotion EXCEPT SELECT pa.nomPatient, pp.nomPotion, po.genre
FROM PATIENT pa
JOIN PRISE_POTION pp ON pa.nomPatient = pp.nomPatient
JOIN POTION po ON pp.nomPotion = po.nomPotion
WHERE po.genre IN ('Curatives', 'Magiques');



-- question 6 : lister les potions créées par Amnésix et Panoramix en 52 avant J-C --

INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion555','Los Angeles','Panoramix', 'Envoûtante', TO_DATE('-0052/01/01','syyyy/mm/dd'), 10);
INSERT INTO POTION (nomPotion, Origine, druideCreateur, genre, dateCreation, posologie)
VALUES ('Potion789','Cuba','Panoramix', 'Envoûtante', TO_DATE('-0052/02/15','syyyy/mm/dd'), 10);


-- forme 1 --
select nomPotion
from POTION
where druideCreateur in ('Panoramix','Amnésix') and POTION.dateCreation >= to_date('-0052/01/01','syyyy/mm/dd') and POTION.dateCreation <= to_date('-0052/12/31','syyyy/mm/dd');

-- forme 2 --
select nomPotion
from POTION
where (druideCreateur='Panoramix'and POTION.dateCreation >= to_date('-0052/01/01','syyyy/mm/dd') and POTION.dateCreation <= to_date('-0052/12/31','syyyy/mm/dd'))
or (druideCreateur='Amnésix' and POTION.dateCreation >= to_date('-0052/01/01','syyyy/mm/dd') and POTION.dateCreation <= to_date('-0052/12/31','syyyy/mm/dd'));



-- question 7 : lister les ingrédients intervenant dans toutes les potions de genre ’curatif ’ et la quantité
-- totale utilisée pour chaque ingrédient --

    -- Forme 1 --
SELECT DISTINCT i.nomIngredient, sum(p.posologie) as Quantite
FROM INGREDIENT i, COMPOSITION c, POTION p
WHERE i.nomIngredient = c.nomIngredient AND c.nomPotion = p.nomPotion AND p.genre = 'Curatives'
AND NOT EXISTS (
    SELECT pp.nomPotion
    FROM POTION pp
    WHERE pp.genre <> 'Curatives'
    AND pp.nomPotion = p.nomPotion
) group by i.nomIngredient;

-- Forme 2 --
SELECT i.nomIngredient, SUM(p.posologie) AS Quantite
FROM INGREDIENT i
JOIN COMPOSITION c ON i.nomIngredient = c.nomIngredient
JOIN POTION p ON c.nomPotion = p.nomPotion
WHERE p.genre = 'Curatives'
  AND NOT EXISTS (
    SELECT 1
    FROM POTION pp
    WHERE pp.nomPotion = p.nomPotion AND pp.genre <> 'Curatives'
  )
GROUP BY i.nomIngredient;



-- question 8 : . lister les ingrédients qui ne sont pas utilisés --

-- Forme 1 --
select distinct i.nomIngredient
from INGREDIENT i where
not exists(
    select ii.nomIngredient
    from INGREDIENT ii, COMPOSITION c
    where ii.nomIngredient = c.nomIngredient
    and ii.nomIngredient = i.nomIngredient
);

-- Forme 2 --
SELECT DISTINCT i.nomIngredient
FROM INGREDIENT i
WHERE NOT EXISTS (
    SELECT 1
    FROM COMPOSITION c
    WHERE c.nomIngredient = i.nomIngredient
);



-- question 9 : lister les patients qui ne consomment que des potions ayant pour origine leur village --

    -- Forme 1 --
select distinct p.nomPatient
from Patient p, PRISE_POTION pp, POTION po
where po.nomPotion = pp.nomPotion
and pp.nomPatient = p.nomPatient
and not exists(
    select 1
    from POTION po2, PRISE_POTION pp2, PATIENT p2
    where po2.nomPotion = po.nomPotion
    and pp2.nomPatient = p2.nomPatient
    and p.nomPatient = p2.nomPatient
    and po2.Origine <> p2.village
);

-- Forme 2 --
SELECT DISTINCT p.nomPatient
FROM PATIENT p
JOIN PRISE_POTION pp ON p.nomPatient = pp.nomPatient
JOIN POTION po ON pp.nomPotion = po.nomPotion
WHERE p.nomPatient NOT IN (
    SELECT p2.nomPatient
    FROM PATIENT p2
    JOIN PRISE_POTION pp2 ON p2.nomPatient = pp2.nomPatient
    JOIN POTION po2 ON pp2.nomPotion = po2.nomPotion
    WHERE po2.Origine <> p2.village
);



-- question 10 : lister les patients qui consomment toutes les potions ayant pour origine leur village --

select distinct P.nomPatient
from PRISE_POTION INNER JOIN PATIENT P on P.nomPatient = PRISE_POTION.nomPatient
INNER JOIN POTION P2 on PRISE_POTION.nomPotion = P2.nomPotion
where village=origine;



-- question 11 : lister les potions et éventuellement les ingrédients qui les composent --
select po.nomPotion, co.nomIngredient from POTION po
left join COMPOSITION co on po.nomPotion = co.nomPotion;



-- question 12 : . années de création des 5 potions les plus anciennes --

SELECT EXTRACT(YEAR from dateCreation)
FROM POTION
ORDER BY dateCreation ASC
FETCH FIRST 5 ROWS ONLY;



-- question 13 : nom des druides dont le nombre de potions inventées est supérieur au nombre de potions
-- créées par Amnésix --

-- Forme 1 --
select po.druideCreateur, count(*) as NB_CREE
from POTION po
group by druideCreateur
having count(*) > (select count(*) as NB_CREE
                   from POTION po
                   where po.druideCreateur = 'Amnesix'
                   group by druideCreateur);

-- Forme 2 --
SELECT druideCreateur, COUNT(*) AS NB_CREE
FROM POTION
GROUP BY druideCreateur
HAVING COUNT(*) > (
    SELECT SUM(CASE WHEN druideCreateur = 'Amnesix' THEN 1 ELSE 0 END)
    FROM POTION
);



-- question 14 : liste des druides qui n’ont proposé aucune potion entre 52 et 40 avant J-C --


select distinct P.druideCreateur
from POTION P except select P.druideCreateur
from POTION P
where P.dateCreation between to_date('-0052/01/01','syyyy/mm/dd') AND to_date('-0040/01/01','syyyy/mm/dd');


-- question 15 : quels sont les druides dont toutes les potions créées sont dans les genres ’curatif ’ et ’magique’ --

-- Forme 1 --
SELECT DISTINCT P.druideCreateur
FROM POTION P
WHERE NOT EXISTS (
    SELECT 1
    FROM POTION PP
    WHERE P.druideCreateur = PP.druideCreateur
    AND PP.genre NOT IN ('Curatives', 'Magiques')
);

-- Forme 2 --
SELECT DISTINCT P.druideCreateur
FROM POTION P
WHERE P.druideCreateur NOT IN (
    SELECT druideCreateur
    FROM POTION
    WHERE genre NOT IN ('Curatives', 'Magiques')
);

