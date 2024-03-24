create table unicode as select * from dataset.unicode;

alter table unicode add constraint pk_unicode primary key (codepoint);
alter table unicode add constraint fk_upper foreign key (uppercase)
references unicode(codepoint);
alter table unicode add constraint fk_lower foreign key (lowercase)
references unicode(codepoint);
alter table unicode add constraint fk_title foreign key (titlecase)
references unicode(codepoint);


-- 1. Prise en main --
-- Découverte du plan d'éxéecution --
SELECT u1.codepoint, u1.charname
FROM unicode u1 JOIN unicode u2 ON u2.codepoint = u1.uppercase WHERE u2.category_ = 'Lu';


-- Question 1 : 18 ms et 1331 n-uplets --

-- Question 3 : --
drop index idx_unicode_couvrant;

explain plan for
SELECT u1.codepoint, u1.charname
FROM unicode u1 JOIN unicode u2 ON u2.codepoint = u1.uppercase WHERE u2.category_ = 'Lu';

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

/*

------------------------------------------------------------------------------
| Id  | Operation          | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |         |  1400 |   109K|   244   (1)| 00:00:01 |
|*  1 |  HASH JOIN         |         |  1400 |   109K|   244   (1)| 00:00:01 |
|*  2 |   TABLE ACCESS FULL| UNICODE |  1781 | 26715 |   122   (1)| 00:00:01 |
|*  3 |   TABLE ACCESS FULL| UNICODE |  1400 | 91000 |   122   (1)| 00:00:01 |
------------------------------------------------------------------------------

SELECT STATEMENT : Pour le select de la requète
HASH JOIN : Correspond à la jointure JOIN
TABLE ACCESS FULL : Pour acceder aux tables lors de la jointure

*/

-- Question 4 --
    -- Clause exist --
select u1.charname, u1.codepoint from unicode u1 where exists (select 1 from unicode u2 where u2.codepoint = u1.UPPERCASE and u2.CATEGORY_= 'LU' );

explain plan for select u1.charname, u1.codepoint from unicode u1 where exists (select 1 from unicode u2 where u2.codepoint = u1.UPPERCASE and u2.CATEGORY_= 'LU' );

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));


    -- Clause in --
select u1.charname, u1.codepoint from unicode u1 where u1.uppercase in (select u2.CODEPOINT from unicode u2 where u2.CATEGORY_= 'LU' );

explain plan for select u1.charname, u1.codepoint from unicode u1 where u1.uppercase
in (select u2.CODEPOINT from unicode u2 where u2.CATEGORY_= 'LU' );

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));


    -- Augmentée d'une tautologie triviale --
select u1.codepoint, u1.charname from unicode u1 join unicode u2 on u2.CODEPOINT = u1.UPPERCASE
where u2.CATEGORY_ = 'LU' and (u1.COMBINING > 0 or u1.COMBINING <= 0);


explain plan for select u1.codepoint, u1.charname from unicode u1 join unicode u2 on u2.CODEPOINT = u1.UPPERCASE
where u2.CATEGORY_ = 'LU' and (u1.COMBINING > 0 or u1.COMBINING <= 0);

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

    -- Augmentée d'une tautologie non triviale --
select u1.codepoint, u1.charname from unicode u1 join unicode u2 on u2.CODEPOINT = u1.UPPERCASE
where u2.CATEGORY_ = 'LU' and (NOT(NOT(u1.COMBINING) >= 0 and (u1.COMBINING >= 0 or u1.DIGIT >= 0)) or u1.DIGIT >= 0);

explain plan for select u1.codepoint, u1.charname from unicode u1 join unicode u2 on u2.CODEPOINT = u1.UPPERCASE
where u2.CATEGORY_ = 'LU' and (NOT(NOT(u1.COMBINING) >= 0 and (u1.COMBINING >= 0 or u1.DIGIT >= 0)) or u1.DIGIT >= 0);

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));



-- Les Statistiques --
-- Pour rafraichir manuellement les stats
begin
    dbms_stats.gather_table_stats('E219118X', 'UNICODE');
end;


-- Question 6 : --

BEGIN
    dbms_stats.delete_table_stats('E219118X', 'UNICODE');
    dbms_stats.gather_table_stats('E219118X', 'UNICODE');
END;

select * from user_tab_statistics us where us.table_name = 'UNICODE';
select * from user_tab_col_statistics uc where uc.table_name = 'UNICODE';

-- Question 7 --

BEGIN
    dbms_stats.delete_table_stats('E219118X', 'UNICODE');
end;

BEGIN
    dbms_stats.gather_table_stats('E219118X', 'UNICODE');
end;

select column_name, histogram from all_tab_col_statistics where table_name = 'UNICODE' and owner = 'E219118X';


-- Question 8 --
BEGIN
    dbms_stats.delete_table_stats('E219118X', 'UNICODE');
end;

explain plan for
select u1.codepoint, u1.charname
from unicode u1 join unicode u2 on u2.codepoint = u1.UPPERCASE
where u2.CATEGORY_ = 'Lu';


select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

-- Les index --
-- Question 10 -- Nombre de clés : 32 292, taille_extent : 1048576 car pctincrease = 0, et max_extent : 2147483645 donc on calcul le nombre de clés par page et le nombre de pages
-- Obtenir les propriétés de l'index à partir de user_indexes
SELECT *
FROM user_indexes
WHERE table_name = 'UNICODE';


-- Obtenir les propriétés de la taille à partir de user_segments
SELECT *
FROM user_segments where segment_name = 'UNICODE';

-- Question 11 --
-- Modification de table unicode pour ajouter la contrainte
alter table unicode add constraint contrainte1 unique(OLDNAME);

select * from user_indexes where INDEX_NAME='CONTRAINTE1';

-- Question 12 --
-- Création index couvrant composant --
create index idx_unicode_couvrant on unicode(CODEPOINT,UPPERCASE, CATEGORY_, CHARNAME );

-- verif, On l'a bien créé --
select * from user_indexes where index_name='IDX_UNICODE_COUVRANT';
-- Taille faire avec les extents, la taille max etc comme avant --

-- Voir si avec le nouvel index on est plus rapide --
explain plan for
SELECT u1.codepoint, u1.charname
FROM unicode u1 JOIN unicode u2 ON u2.codepoint = u1.uppercase WHERE u2.category_ = 'Lu';

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

-- Question 13 --
CREATE table unicode2 (
    codepoint NVARCHAR2(6) PRIMARY KEY,
    charname NVARCHAR2(100),
    uppercase NVARCHAR2(6),
    category_ NCHAR(2),
    FOREIGN KEY (codepoint) REFERENCES UNICODE(CODEPOINT)
)

ORGANIZATION INDEX
INCLUDING category_ overflow;

insert into unicode2 (codepoint, charname, uppercase, category_)
SELECT codepoint, charname, uppercase, category_ from unicode;

BEGIN
    dbms_stats.gather_table_stats('E219118X', 'UNICODE');
end;

-- VERIF DE LA CREATION --
select * from user_indexes where table_name='UNICODE2';

-- Question 14 --

explain plan for
select u1.codepoint, u1.charname
from unicode2 u1 join unicode2 u2 on u2.codepoint = u1.uppercase where u2.category_ = 'LU';


-- VERIF --
select *
from TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE'));
-- RESULTAT --
/*
Plan hash value: 4102758516

--------------------------------------------------------------------------------------------
| Id  | Operation             | Name               | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT      |                    |    24 |  3168 |  6125   (1)| 00:00:01 |
|*  1 |  HASH JOIN            |                    |    24 |  3168 |  6125   (1)| 00:00:01 |
|*  2 |   INDEX FAST FULL SCAN| SYS_IOT_TOP_130367 |     4 |    56 |  3062   (0)| 00:00:01 |
|   3 |   INDEX FAST FULL SCAN| SYS_IOT_TOP_130367 | 31890 |  3674K|  3062   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

"   1 - access(""U2"".""CODEPOINT""=""U1"".""UPPERCASE"")"
"   2 - filter(""U2"".""CATEGORY_""=U'LU')"

Note
-----
   - dynamic statistics used: dynamic sampling (level=2)
*/

-- Question 15 --
/* L'index cluster est plus efficace que l'index couvrant composite malgré que les 2 soient plus performant que
   l'index classique, l'index cluster va analyser moins de butes ce qui va lui perlettre de
   gagner du temps surtout sur le where.
 */


-- Partie 2 : Analyse du plan d'éxecution --
/*
La phrase "profil de charge des requêtes posées par une application" se réfère à une analyse
ou à une description des types de requêtes que génère une application dans le cadre de son utilisation normale.
*/

-- Question 1 : Recherche --

select charname
from unicode
where category_ = 'Lu'
and charname like 'LATIN%' order by charname asc;


explain plan for
select charname
from unicode
where category_ = 'Lu'
and charname like 'LATIN%' order by charname asc;

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

/*
------------------------------------------------------------------------------
| Id  | Operation          | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |         |    57 |  3306 |   123   (2)| 00:00:01 |
|   1 |  SORT ORDER BY     |         |    57 |  3306 |   123   (2)| 00:00:01 |
|*  2 |   TABLE ACCESS FULL| UNICODE |    57 |  3306 |   122   (1)| 00:00:01 |
------------------------------------------------------------------------------

SELECT STATEMENT : Permet de selectionner la colonne charname de la table UNICODE
SORT ORDER BY : Pour trier dans l'ordre ascendant
TABLE ACCESS FULL : accès à la table UNICODE

*/

-- Question 2 --

select count(codepoint)
from unicode
where bidi = 'ON';

explain plan for
select count(codepoint)
from unicode
where bidi = 'ON';

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

/*
------------------------------------------------------------------------------
| Id  | Operation          | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |         |     1 |     4 |   122   (1)| 00:00:01 |
|   1 |  SORT AGGREGATE    |         |     1 |     4 |            |          |
|*  2 |   TABLE ACCESS FULL| UNICODE |  1404 |  5616 |   122   (1)| 00:00:01 |
------------------------------------------------------------------------------


*/

-- Question 3 --
select u.codepoint, u.charname,
u.category_,
u.combining,
u.bidi,
u.decomposition, u.decimal_,
u.digit,
u.numeric_,
u.mirrored,
u.oldname,
u.comment_,
lc.charname as lowercase, uc.charname as uppercase, tc.charname as titlecase
from unicode u left outer join unicode lc on u.lowercase=lc.codepoint left outer join unicode uc on u.uppercase=uc.codepoint
left outer join unicode tc on u.titlecase=tc.codepoint
where u.codepoint='0405';

explain plan for
select u.codepoint, u.charname,
u.category_,
u.combining,
u.bidi,
u.decomposition, u.decimal_,
u.digit,
u.numeric_,
u.mirrored,
u.oldname,
u.comment_,
lc.charname as lowercase, uc.charname as uppercase, tc.charname as titlecase
from unicode u left outer join unicode lc on u.lowercase=lc.codepoint left outer join unicode uc on u.uppercase=uc.codepoint
left outer join unicode tc on u.titlecase=tc.codepoint
where u.codepoint='0405';

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

/*
---------------------------------------------------------------------------------------------
| Id  | Operation                      | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT               |            |     1 |   280 |     5   (0)| 00:00:01 |
|   1 |  NESTED LOOPS OUTER            |            |     1 |   280 |     5   (0)| 00:00:01 |
|   2 |   NESTED LOOPS OUTER           |            |     1 |   217 |     4   (0)| 00:00:01 |
|   3 |    NESTED LOOPS OUTER          |            |     1 |   154 |     3   (0)| 00:00:01 |
|   4 |     TABLE ACCESS BY INDEX ROWID| UNICODE    |     1 |    91 |     2   (0)| 00:00:01 |
|*  5 |      INDEX UNIQUE SCAN         | PK_UNICODE |     1 |       |     1   (0)| 00:00:01 |
|   6 |     TABLE ACCESS BY INDEX ROWID| UNICODE    |     1 |    63 |     1   (0)| 00:00:01 |
|*  7 |      INDEX UNIQUE SCAN         | PK_UNICODE |     1 |       |     0   (0)| 00:00:01 |
|   8 |    TABLE ACCESS BY INDEX ROWID | UNICODE    |     1 |    63 |     1   (0)| 00:00:01 |
|*  9 |     INDEX UNIQUE SCAN          | PK_UNICODE |     1 |       |     0   (0)| 00:00:01 |
|  10 |   TABLE ACCESS BY INDEX ROWID  | UNICODE    |     1 |    63 |     1   (0)| 00:00:01 |
|* 11 |    INDEX UNIQUE SCAN           | PK_UNICODE |     1 |       |     0   (0)| 00:00:01 |
---------------------------------------------------------------------------------------------



*/

-- Question 4 --
select avg(length(u.charname)) from unicode u join unicode uc on u.uppercase = uc.codepoint where uc.oldname like '%GREEK%';

explain plan for
select avg(length(u.charname)) from unicode u join unicode uc on u.uppercase = uc.codepoint where uc.oldname like '%GREEK%';

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

/*
---------------------------------------------------------------------------------------------
| Id  | Operation                | Name             | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT         |                  |     1 |    70 |   233   (1)| 00:00:01 |
|   1 |  SORT AGGREGATE          |                  |     1 |    70 |            |          |
|*  2 |   HASH JOIN              |                  |   101 |  7070 |   233   (1)| 00:00:01 |
|   3 |    VIEW                  | index$_join$_002 |    99 |  1485 |   111   (1)| 00:00:01 |
|*  4 |     HASH JOIN            |                  |       |       |            |          |
|*  5 |      INDEX FAST FULL SCAN| CONTRAINTE1      |    99 |  1485 |    24   (0)| 00:00:01 |
|   6 |      INDEX FAST FULL SCAN| PK_UNICODE       |    99 |  1485 |   114   (0)| 00:00:01 |
|*  7 |    TABLE ACCESS FULL     | UNICODE          |  1400 | 77000 |   122   (1)| 00:00:01 |
---------------------------------------------------------------------------------------------

*/


-- Partie 3 : Les opérateurs --

-- Question 1.a : INDEX RANGE SCAN --
select * from unicode where codepoint between '00AE' and '00B5';

explain plan for select * from unicode where codepoint between '00AE' and '00B5';

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));


-- Question 1.b : Index skip scan --

create index idx_skip on unicode(category_, charname, combining);

explain plan for
select u1.CATEGORY_, u1.CHARNAME, u1.COMBINING from unicode u1
where 'INVERTED QUESTION MARK' = u1.CHARNAME;

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

-- Question 2.a : NESTED LOOP --
explain plan for
select * from unicode u1, unicode u2
where u1.CODEPOINT = u2.LOWERCASE and u1.CODEPOINT = u2.UPPERCASE;

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));


-- Qestion 2.b : Merge join --
explain plan for
select /*+ use_merge(u1,u2) */ u1.UPPERCASE, u2.LOWERCASE
                 from unicode u1 join unicode u2 on u1.UPPERCASE = u2.LOWERCASE;

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));


-- Question 3 :  triple jointure --
explain plan for
SELECT /*+ use_merge(u1,u2) */ *
FROM unicode u1
JOIN unicode u2 ON u1.codepoint = u2.uppercase
JOIN unicode u3 ON u1.lowercase = u3.codepoint
JOIN unicode u4 ON u2.codepoint = u4.lowercase;

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));


-- Question 4.a : SORT UNIQUE --
explain plan for
select distinct u1.DIGIT from unicode u1 order by u1.DIGIT;

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));

-- question 4.b : HASH GROUP BY --
drop index idx_skip;

explain plan for
SELECT category_
FROM unicode
GROUP BY category_;

select * from table (DBMS_XPLAN.DISPLAY('PLAN_TABLE'));
