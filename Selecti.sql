

SELECT naziv_proizvoda, opis_proizvoda, cijena, url_slike, proizvodjac
FROM proizvodi
WHERE kategorija_proizvoda = 1 AND kolicina_dostupna > 0;

SELECT naziv_kategorije, COUNT(id_proizvoda) as 'Broj proizvoda'
FROM proizvodi
JOIN kategorije ON proizvodi.kategorija_proizvoda = kategorije.id_kategorije
GROUP BY kategorija_proizvoda;

SELECT naziv_proizvoda, AVG(ocjena) as 'Prosjecna ocjena'
FROM proizvodi
JOIN recenzije ON proizvodi.id_proizvoda = recenzije.id_proizvoda
GROUP BY naziv_proizvoda;

SELECT proizvodjac,naziv_proizvodjaca, SUM(kolicina) as 'Broj prodanih proizvoda'
FROM proizvodi
JOIN proizvodjaci ON proizvodi.proizvodjac = proizvodjaci.id_proizvodjaca
JOIN naruceni_proizvodi ON proizvodi.id_proizvoda = naruceni_proizvodi.id_proizvoda
GROUP BY proizvodjac
ORDER BY SUM(kolicina) DESC;

SELECT narudzbe.id_narudzbe, SUM(cijena*kolicina) as 'Ukupni Prihodi'
FROM narudzbe
JOIN naruceni_proizvodi ON narudzbe.id_narudzbe = naruceni_proizvodi.id_narudzbe
JOIN proizvodi ON naruceni_proizvodi.id_proizvoda = proizvodi.id_proizvoda
GROUP BY narudzbe.id_narudzbe
ORDER BY SUM(cijena*kolicina);
