DROP TABLE unicode;

CREATE TABLE unicode (
  codepoint nvarchar2(6) PRIMARY KEY,
  charname  nvarchar2(100) NOT NULL,
  category_ nchar(2) NOT NULL,
  combining number NOT NULL,
  bidi nvarchar2(3) NOT NULL,
  decomposition nvarchar2(100),
  decimal_ number,
  digit number,
  numeric_ nvarchar2(100),
  mirrored nchar(1) NOT NULL,
  oldname nvarchar2(100),
  comment_ nvarchar2(100),
  uppercase nvarchar2(6), 
  lowercase nvarchar2(6),
  titlecase nvarchar2(6)
);


-- désactivation des contraintes
--alter table unicode disable constraint fk_upper;
--alter table unicode disable constraint fk_lower;
--alter table unicode disable constraint fk_title;

-- ré-activation des contraintes
--alter table unicode enable constraint fk_upper;
--alter table unicode enable constraint fk_lower;
--alter table unicode enable constraint fk_title;