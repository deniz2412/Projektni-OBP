CREATE FUNCTION ukupnaCijenaKorpe (IN id_korisnika int)
RETURNS float
BEGIN
   DECLARE ukupnaCijena float;
   SET ukupnaCijena = (SELECT SUM(cijena*kolicina) FROM korpa
   JOIN proizvodi ON korpa.id_proizvoda = proizvodi.id_proizvoda
   WHERE id_korisnika = id_korisnika);
   RETURN ukupnaCijena;
END;

