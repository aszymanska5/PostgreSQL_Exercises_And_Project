-- a) kwerenda z zastosowaniem funkcji agregującej
SELECT SUM(o.zarobki) AS laczne_zarobki
FROM osoby o
WHERE o.id_osoby IN (
    SELECT DISTINCT id_osoby
    FROM faktury
);

-- b) kwerenda wyświetlająca imię i nazwisko osób, dla których wystawiono fakturę pomiędzy 01-01-2020 a 01-01-2021
SELECT o.imie, o.nazwisko
FROM osoby o
WHERE EXISTS (
    SELECT 1
    FROM faktury f
    WHERE f.id_osoby = o.id_osoby
      AND f.data_wystawienia BETWEEN TO_DATE('01/01/2020', 'DD/MM/YYYY') 
                                 AND TO_DATE('01/01/2021', 'DD/MM/YYYY')
);

-- c) kwerenda wyświetlająca imię i nazwisko osób, dla których wystawiono więcej niż jedną fakturę
SELECT o.imie, o.nazwisko
FROM osoby o
WHERE o.id_osoby IN (
    SELECT f.id_osoby
    FROM faktury f
    GROUP BY f.id_osoby
    HAVING COUNT(*) > 1
);

-- d) kwerenda wyświetlająca imię i nazwisko osób, które kiedykolwiek płaciły gotówką
SELECT o.imie, o.nazwisko
FROM osoby o
WHERE EXISTS (
    SELECT 1
    FROM faktury f
    WHERE f.id_osoby = o.id_osoby
      AND f.forma_platnosci = 'gotówka'
);
