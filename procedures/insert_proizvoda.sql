create
    definer = root@localhost procedure insert_proizvoda(IN naziv_proizvoda varchar(255), IN opis_proizvoda varchar(255),
                                                        IN cijena float, IN url_slike varchar(255),
                                                        IN kategorija_proizvoda int, IN proizvodjac int,
                                                        IN kolicina_dostupna int, IN datum_kreiranja date)
BEGIN
    INSERT INTO proizvodi (naziv_proizvoda, opis_proizvoda, cijena, url_slike, kategorija_proizvoda, proizvodjac, kolicina_dostupna, datum_kreiranja)
    VALUES (naziv_proizvoda, opis_proizvoda, cijena, url_slike, kategorija_proizvoda, proizvodjac, kolicina_dostupna, datum_kreiranja);
END;

