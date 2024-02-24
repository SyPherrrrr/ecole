-- Création de la table fournisseur
CREATE TABLE fournisseur (
    id VARCHAR(5) PRIMARY KEY,
    nom VARCHAR(50),
    statut INT,
    ville VARCHAR(50)
);

-- Insertion des données dans la table fournisseur
INSERT INTO fournisseur (id, nom, statut, ville) VALUES ('f1', 'Alfred', 20, 'Londres');
INSERT INTO fournisseur (id, nom, statut, ville) VALUES ('f2', 'Robert', 10, 'Paris');
INSERT INTO fournisseur (id, nom, statut, ville) VALUES ('f3', 'Raymonde', 30, 'Paris');
INSERT INTO fournisseur (id, nom, statut, ville) VALUES ('f4', 'Gaston', 20, 'Londres');
INSERT INTO fournisseur (id, nom, statut, ville) VALUES ('f5', 'Hector', 30, 'Nantes');

select * from fournisseur;

select S1.id, S2.id from fournisseur S1, fournisseur S2
where S1.ville=S2.ville and S1.id<S2.id;


-- Création de la table Fourniture (SP)
CREATE TABLE Fourniture (
    F VARCHAR(10),
    P VARCHAR(10),
    Qte INT
);

-- Insertions de données
INSERT INTO Fourniture (F, P, Qte) VALUES ('f1', 'p1', 300);
INSERT INTO Fourniture (F, P, Qte) VALUES ('f1', 'p2', 200);
INSERT INTO Fourniture (F, P, Qte) VALUES ('f1', 'p3', 400);
INSERT INTO Fourniture (F, P, Qte) VALUES ('f1', 'p4', 200);
INSERT INTO Fourniture (F, P, Qte) VALUES ('f1', 'p5', 100);
INSERT INTO Fourniture (F, P, Qte) VALUES ('f1', 'p6', 100);

INSERT INTO Fourniture (F, P, Qte) VALUES ('f2', 'p1', 300);
INSERT INTO Fourniture (F, P, Qte) VALUES ('f2', 'p2', 400);

INSERT INTO Fourniture (F, P, Qte) VALUES ('f3', 'p2', 200);

INSERT INTO Fourniture (F, P, Qte) VALUES ('f4', 'p2', 200);
INSERT INTO Fourniture (F, P, Qte) VALUES ('f4', 'p4', 300);
INSERT INTO Fourniture (F, P, Qte) VALUES ('f4', 'p5', 400);

select distinct S.nom from FOURNITURE SP, fournisseur S where SP.f = S.id and SP.P = 'p2';

select distinct S.nom from FOURNITURE SP, fournisseur S where SP.f = S.id and SP.P in ('p1','p4','p6');