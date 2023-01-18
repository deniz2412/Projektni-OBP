create
    definer = root@localhost procedure update_kolicine_proizvoda(IN id_proizvoda int, IN kolicina int)
BEGIN
	UPDATE proizvodi
    SET kolicina_dostupna = kolicina
    WHERE id_proizvoda = id_proizvoda;
END;