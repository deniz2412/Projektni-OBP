USE projekat;

LOAD DATA INFILE '../testdata/korisnici.csv' INTO TABLE korisnici
    FIELDS TERMINATED BY ','
    ENCLOSED BY ''
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;