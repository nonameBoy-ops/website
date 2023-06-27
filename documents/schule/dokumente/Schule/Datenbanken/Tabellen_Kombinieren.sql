use muecke_1;
SELECT name, vorname, plz, ort 
FROM muecke_1.personal, muecke_1.orte
where personal.ortnr = orte.ortnr ;