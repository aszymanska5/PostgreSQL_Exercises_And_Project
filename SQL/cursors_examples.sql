-- A
BEGIN; 

DECLARE kursor_produkty CURSOR FOR 
SELECT produkt_id, nazwa, cena, ilosc FROM produkty WHERE cena > 100 ORDER BY cena;

FETCH FORWARD 5 FROM kursor_produkty;

MOVE FORWARD 3 IN kursor_produkty;

FETCH NEXT FROM kursor_produkty;

CLOSE kursor_produkty;

COMMIT;


-- B
BEGIN;

DECLARE kursor_produkty CURSOR FOR 
SELECT produkt_id, nazwa, cena, ilosc FROM produkty WHERE cena > 100 ORDER BY cena;

FETCH FIRST FROM kursor_produkty;

UPDATE produkty SET ilosc = ilosc + 10 WHERE CURRENT OF kursor_produkty;

CLOSE kursor_produkty;

COMMIT;