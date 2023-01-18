CREATE FUNCTION naStanju (IN id_proizvoda int)
RETURNS varchar(10)
BEGIN
   DECLARE stanje varchar(10);
   SET stanje = (SELECT CASE
                        WHEN proizvodi.kolicina_dostupna > 0 THEN 'Na Stanju'
                        ELSE 'Nestalo'
                    END
    FROM proizvodi
    WHERE id_proizvoda = id_proizvoda);
   RETURN stanje;
END




