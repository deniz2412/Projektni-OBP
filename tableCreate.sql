-- CREATE SCHEMA projekat;

CREATE TABLE korisnici (
    id_korisnika INT PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(255) NOT NULL,
    prezime VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    sifra VARCHAR(255) NOT NULL,
    adresa_dostave VARCHAR(255) NOT NULL,
    adresa_kupovine VARCHAR(255) NOT NULL,
    broj_telefona VARCHAR(255) UNIQUE NOT NULL,
    datum_kreiranja DATE NOT NULL,
    INDEX email_index (email),
    INDEX broj_index (broj_telefona)
);
CREATE TABLE kategorije (
    id_kategorije INT PRIMARY KEY AUTO_INCREMENT,
    naziv_kategorije VARCHAR(255) NOT NULL UNIQUE,
    opis_kategorije TEXT NOT NULL
);
CREATE TABLE proizvodjaci (
    id_proizvodjaca INT PRIMARY KEY AUTO_INCREMENT,
    naziv_proizvodjaca VARCHAR(255) NOT NULL UNIQUE,
    opis_proizvodjaca TEXT NOT NULL
);
CREATE TABLE proizvodi (
    id_proizvoda INT PRIMARY KEY AUTO_INCREMENT,
    naziv_proizvoda VARCHAR(255) NOT NULL,
    opis_proizvoda TEXT NOT NULL,
    cijena DECIMAL(10, 2) NOT NULL CHECK (cijena > 0),
    url_slike VARCHAR(255),
    kategorija_proizvoda INT NOT NULL,
    proizvodjac INT NOT NULL,
    kolicina_dostupna INT NOT NULL CHECK (kolicina_dostupna >= 0),
    datum_kreiranja DATE NOT NULL,
    FOREIGN KEY (kategorija_proizvoda) REFERENCES kategorije(id_kategorije),
    FOREIGN KEY (proizvodjac) REFERENCES proizvodjaci(id_proizvodjaca),
    INDEX proizvod_index (naziv_proizvoda)
                       );
CREATE TABLE narudzbe (
    id_narudzbe INT PRIMARY KEY AUTO_INCREMENT,
    id_korisnika INT NOT NULL,
    ukupno DECIMAL(10, 2) NOT NULL CHECK (ukupno > 0),
    datum_narudzbe DATE NOT NULL,
    adresa_dostave VARCHAR(255) NOT NULL,
    adresa_naplate VARCHAR(255) NOT NULL,
    stanje_narudzbe ENUM('Naručeno','Dostavlja se','Dostavljeno','Otkazano') NOT NULL,
    FOREIGN KEY (id_korisnika) REFERENCES korisnici(id_korisnika),
    INDEX narudzba_index (id_narudzbe)
);

CREATE TABLE naruceni_proizvodi (
    id_narudzbe INT NOT NULL,
    id_proizvoda INT NOT NULL,
    kolicina INT NOT NULL CHECK (kolicina > 0),
    cijena DECIMAL(10, 2) NOT NULL CHECK (cijena > 0),
    PRIMARY KEY (id_narudzbe, id_proizvoda),
    FOREIGN KEY (id_narudzbe) REFERENCES narudzbe(id_narudzbe),
    FOREIGN KEY (id_proizvoda) REFERENCES proizvodi(id_proizvoda),
    INDEX np_index (id_proizvoda,id_narudzbe)
);
CREATE TABLE recenzije (
    id_recenzije INT PRIMARY KEY AUTO_INCREMENT,
    id_korisnika INT NOT NULL,
    id_proizvoda INT NOT NULL,
    sadrzaj TEXT NOT NULL,
    datum_kreiranja DATE NOT NULL,
    ocjena INT NOT NULL CHECK ( ocjena >= 1 AND ocjena <= 5 ),
    FOREIGN KEY (id_korisnika) REFERENCES korisnici(id_korisnika),
    FOREIGN KEY (id_proizvoda) REFERENCES proizvodi(id_proizvoda),
    INDEX ocjena_index (ocjena)
);
CREATE TABLE lista_zelja (
    id_korisnika INT NOT NULL,
    id_proizvoda INT NOT NULL,
    datum_dodavanja DATE NOT NULL,
    PRIMARY KEY (id_korisnika, id_proizvoda),
    FOREIGN KEY (id_korisnika) REFERENCES korisnici(id_korisnika),
    FOREIGN KEY (id_proizvoda) REFERENCES proizvodi(id_proizvoda),
    INDEX lista_zelja_index (id_korisnika)
);
CREATE TABLE korpa (
    id_korisnika INT NOT NULL,
    id_proizvoda INT NOT NULL,
    kolicina INT NOT NULL CHECK ( kolicina > 0 ),
    cijena_proizvoda DECIMAL(10, 2) NOT NULL CHECK ( cijena_proizvoda > 0 ),
    datum_kreiranja DATE NOT NULL,
    PRIMARY KEY (id_korisnika, id_proizvoda),
    FOREIGN KEY (id_korisnika) REFERENCES korisnici(id_korisnika),
    FOREIGN KEY (id_proizvoda) REFERENCES proizvodi(id_proizvoda),
    INDEX korpa_index (id_korisnika)
);
CREATE TABLE placanja (
    id_uplate INT PRIMARY KEY AUTO_INCREMENT,
    id_narudzbe INT NOT NULL,
    nacin_placanja ENUM('PayPal','Kartica','Žiralno') NOT NULL,
    iznos DECIMAL(10, 2) NOT NULL CHECK ( iznos > 0 ),
    datum_uplate DATE NOT NULL,
    FOREIGN KEY (id_narudzbe) REFERENCES narudzbe(id_narudzbe),
    INDEX placanje_index (id_uplate)
);