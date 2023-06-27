use muecke_1;

SELECT #1
    name, vorname, durchwahl, kostnr
FROM
    `muecke_1`.`personal`
ORDER BY kostnr DESC , name ASC, vorname;

SELECT #2
    vorname, name, gehalt
FROM
    `muecke_1`.`personal`
WHERE name ="%or%";


SELECT #4
    vorname, name, gehalt, gebtag
FROM
    `muecke_1`.`personal`
WHERE
    gehalt >= '5000';

    
SELECT #5
    name, gebtag, eintritt
FROM
    `muecke_1`.`personal`
WHERE
    gebtag < '1970-01-01'
    ORDER BY gebtag ASC;
    
    
SELECT #6
    vorname, name, kostnr, gehalt * 13 AS Jahresgehalt # AS BLA = BLA in der Tabelle
FROM
    `muecke_1`.`personal`
WHERE
    kostnr = '04';
    
    
SELECT #7
    vorname, name, steuerklasse
FROM
    `muecke_1`.`personal`
WHERE
    geschlecht = 'W' AND steuerklasse = 'II';
    
    
SELECT #8
    vorname, name, kostnr
FROM
    `muecke_1`.`personal`
WHERE
    kostnr = '02' OR kostnr = '05'
ORDER BY kostnr DESC , name;


SELECT #9
    vorname, name, kostnr
FROM
    `muecke_1`.`personal`
WHERE
    kostnr != '06'
ORDER BY kostnr DESC;


SELECT #10
    name, gehalt
FROM
    `muecke_1`.`personal`
WHERE
    gehalt BETWEEN 1800 AND 2000
ORDER BY gehalt ASC;


SELECT #11
    name, gebtag, eintritt
FROM
    `muecke_1`.`personal`
WHERE
    YEAR (eintritt) >= '2010';
    
    
SELECT #12
    *
FROM
    `muecke_1`.`personal`
WHERE
    month(gebtag) = 05
ORDER BY gebtag DESC;


SELECT #13
    name, vorname
FROM
    `muecke_1`.`personal`
WHERE
    year(NOW()) - year(eintritt) = 10;

    
SELECT #14
   SUM(gehalt) "Gehaltssumme",
   round(AVG(gehalt),2) "Durchschnittliches Gehalt",
   MAX(gehalt) "Hoechstes Gehalt",
   MIN(gehalt) "Geringstes Gehalt",
   sum(name) "Anzahl Mitarbeiter"
   
FROM
    `muecke_1`.`personal`;
    
    use muecke_1;
    select 
    count(ort)
    from orte;

SELECT #15
   kostnr,
   count(kostnr = 04) Anzahl_Mitarbeiter
FROM
    `muecke_1`.`personal`
WHERE kostnr = '04';