BEGIN;

SELECT * FROM osoby WHERE zarobki > 8000 FOR UPDATE;

INSERT INTO nowe_osoby (
    id_osoby, imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta
)
SELECT
    id_osoby, imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta
FROM osoby
WHERE zarobki > 8000;

DELETE FROM osoby WHERE zarobki > 8000;

COMMIT;

VACUUM VERBOSE osoby;
