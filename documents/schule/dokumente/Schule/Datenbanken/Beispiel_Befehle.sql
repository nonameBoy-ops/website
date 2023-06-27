CREATE DATABASE Befehl_Beispiele;                                                                #Datenbank 'Befehl_Beispiele' wird angelegt

USE Befehl_Beispiele;																			 #Die Datenbank 'Befehl_Beispiele' wird benutzt

CREATE TABLE Personen                                              								 #Tabelle Personen wird erstellt, mit folgenden Attributen:
(
  id         INTEGER      NOT NULL,																	#Attr. 'id' mit Dat.typ INTEGER, 'NOT NULL' == MUSS einen Wert haben!
  Name       VARCHAR(32)  NOT NULL,																    #Attr. 'Name' mit Dat.typ VARCHAR(32), 'NOT NULL' == MUSS einen Wert haben!
  Abteilung  VARCHAR(32),																			#Attr. 'Abteilung' mit Dat.typ VARCHAR(32)
  Tel        VARCHAR(32),																			#Attr. 'Tel' mit Dat.typ VARCHAR(32)
  Plz        INTEGER,																				#Attr. 'Plz' mit Dat.typ INTEGER
  Ort        VARCHAR(32),																			#Attr. 'Ort' mit Dat.typ VARCHAR(32)
  UNIQUE ( id ),                                                                                    #Attr. 'id' gibt es nur EIN - mal
  PRIMARY KEY ( id ) 																				#Attr. 'id' ist der Primär-Schlüssel
);

INSERT INTO Personen VALUES (  01, 'Gabi',          'Sekr', '100', null,  '' );                     #Eintrag in Tabelle Personen von 'id' = "01"
INSERT INTO Personen VALUES (  02, 'Tatiana',       'GF',   '202', null,  '' );					    #Eintrag in Tabelle Personen von 'Name' = "Tatiana"
INSERT INTO Personen VALUES (  03, 'Manfred',       'GF',   '201', null,  '' );						#Eintrag in Tabelle Personen von 'Abteilung' = "GF"
INSERT INTO Personen VALUES (  04, 'Iris',          'MK',   '401', null,  '' );                     #Eintrag in Tabelle Personen von 'Tel' = "401"
INSERT INTO Personen VALUES (  05, 'René',          'PM',   '501', null,  '' ); 					#Eintrag in Tabelle Personen von 'Plz' hat keinen Wert
INSERT INTO Personen VALUES (  06, 'Elena',         'MM',   '301', null,  '' ); 					#Eintrag in Tabelle Personen von 'Ort' hat keinen Eintrag 
INSERT INTO Personen VALUES (  07, 'Aidar',         'MM',   '301', null,  '' );
INSERT INTO Personen VALUES (  08, 'Oleg',          'MM',   '301', null,  '' );
INSERT INTO Personen VALUES (  09, 'Andreas',       'Entw', '610', 52525, 'Heinsberg' );
INSERT INTO Personen VALUES (  10, 'Arthur',        'Entw', '612', 52499, 'Baesweiler' );
INSERT INTO Personen VALUES (  11, 'Gregor',        'Entw', '611', 52351, 'Düren' );
INSERT INTO Personen VALUES (  12, 'Michael',       'Entw', '616', 50859, 'Köln' );
INSERT INTO Personen VALUES (  13, 'Norbert',       'Entw', '614', 52134, 'Herzogenrath' );
INSERT INTO Personen VALUES (  14, 'Roland',        'Entw', '601', 52134, 'Herzogenrath' );
INSERT INTO Personen VALUES (  15, 'Stefan',        'Entw', '613', 52062, 'Aachen' );
INSERT INTO Personen VALUES (  16, 'Torsten',       'Entw', '601', 52072, 'Aachen' );
INSERT INTO Personen VALUES (  17, 'Werner',        'Entw', '615', 52076, 'Aachen' );
INSERT INTO Personen VALUES (  18, 'FAX',           null,   '101', null,  '' );
INSERT INTO Personen VALUES (  19, 'Konferenzraum', null,   '700', null,  '' );

CREATE TABLE Speisen																		        #Tabelle Speisen wird erstellt, mit folgenden Attributen:
(
  id         INTEGER       NOT NULL,
  Gericht    VARCHAR(255)  NOT NULL,
  Preis      FLOAT         NOT NULL,
  Zutaten    VARCHAR(255),
  UNIQUE ( id ),
  UNIQUE ( Gericht ),
  PRIMARY KEY ( id )
);

INSERT INTO Speisen VALUES (  101, 'Pizza Diabolo', 5.50, 'Teufelsohren' );
INSERT INTO Speisen VALUES (  102, 'Pizza Vulkano', 6.00, 'Teig, Käse, Vesuvtomaten' );
INSERT INTO Speisen VALUES (  103, 'Pizza Feuro', 6.50, 'Pepperoni' );
INSERT INTO Speisen VALUES (  104, 'Lasagno', 6, 'Nudeln, Hackfleisch' );
INSERT INTO Speisen VALUES (  105, 'Salat Eskimo', 4.50, 'Eiswürfel' );



CREATE TABLE Bestellung
(
  id         INTEGER  NOT NULL,
  id_Kunde   INTEGER  NOT NULL,
  id_Speise  INTEGER  NOT NULL,
  UNIQUE ( id ),
  PRIMARY KEY ( id )
);

INSERT INTO Bestellung VALUES (  01, 09, 105 );
INSERT INTO Bestellung VALUES (  02, 11, 103 );
INSERT INTO Bestellung VALUES (  03, 12, 103 );
INSERT INTO Bestellung VALUES (  04, 14, 103 );
INSERT INTO Bestellung VALUES (  05, 15, 101 );
INSERT INTO Bestellung VALUES (  06, 15, 102 );
INSERT INTO Bestellung VALUES (  07, 15, 103 );
INSERT INTO Bestellung VALUES (  08, 16, 104 );
INSERT INTO Bestellung VALUES (  09, 17, 103 );

#-----------------------------------------------------------------------------------;
SELECT * FROM Personen ORDER BY id;
SELECT * FROM Personen ORDER BY Abteilung, Name;
SELECT * FROM Personen ORDER BY Abteilung DESC, Name;
SELECT Name, Ort FROM Personen WHERE Ort = 'aaCHen';
SELECT * FROM Personen WHERE Abteilung = 'Entw' AND (Ort = 'Düren' OR Ort = 'Köln');
SELECT * FROM Personen WHERE Abteilung <> 'Entw';
SELECT * FROM Personen WHERE Ort LIKE '%zog%';
SELECT * FROM Personen WHERE Tel LIKE '__0';
SELECT * FROM Personen WHERE Plz BETWEEN 52351 AND 52499;
SELECT * FROM Personen WHERE Abteilung IS NULL;
SELECT DISTINCT Abteilung FROM Personen WHERE Abteilung IS NOT NULL;
SELECT COUNT(*) FROM Personen WHERE Abteilung = 'Entw';
SELECT Abteilung, COUNT(*) "Anzahl Personen pro Abteilung" FROM Personen GROUP BY Abteilung;
SELECT Abteilung, COUNT(*) FROM Personen GROUP BY Abteilung HAVING COUNT(*) >= 3;
#-----------------------------------------------------------------------------------;
SELECT * FROM Speisen ORDER BY id;
SELECT MIN(PREIS), MAX(PREIS), AVG(PREIS), SUM(PREIS), COUNT(PREIS) FROM Speisen;
#-----------------------------------------------------------------------------------;
SELECT * FROM Bestellung ORDER BY id;
SELECT * FROM Bestellung, Personen, Speisen WHERE id_Kunde = Personen.id AND id_Speise = Speisen.id;
SELECT Name, Gericht, Preis 
  FROM Bestellung, Personen, Speisen 
 WHERE id_Kunde = Personen.id AND id_Speise = Speisen.id 
 ORDER BY Name;
SELECT Name, COUNT(*), SUM(Preis) 
  FROM Bestellung, Personen, Speisen 
 WHERE id_Kunde = Personen.id AND id_Speise = Speisen.id 
 GROUP BY Name ORDER BY Name;
SELECT Gericht, COUNT(*), SUM(Preis) 
  FROM Bestellung, Personen, Speisen 
 WHERE id_Kunde = Personen.id AND id_Speise = Speisen.id 
 GROUP BY Gericht ORDER BY Gericht;
#-----------------------------------------------------------------------------------;


