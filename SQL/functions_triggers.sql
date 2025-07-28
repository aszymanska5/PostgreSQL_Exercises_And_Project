-- a) Funkcja SQL odwołująca się do danych z tabeli 

CREATE OR REPLACE FUNCTION osoby_w_przedziale(min_zarobki NUMERIC, max_zarobki NUMERIC)
RETURNS TABLE(imie TEXT, nazwisko TEXT, zarobki NUMERIC) AS
$$
    SELECT imie, nazwisko, zarobki
    FROM osoby
    WHERE zarobki BETWEEN $1 AND $2
    ORDER BY zarobki DESC;
$$
LANGUAGE sql;

-- wywołanie funkcji
SELECT * FROM osoby_w_przedziale(5000, 9000);


-- b) Funkcja wyzwalacza dla innej tabeli

CREATE OR REPLACE FUNCTION produkty_info()
RETURNS TRIGGER AS $$
DECLARE
    nazwa_produktu TEXT;
BEGIN
    IF (TG_OP = 'DELETE') THEN
        nazwa_produktu := OLD.produkt;
    ELSE
        nazwa_produktu := NEW.produkt;
    END IF;

    RAISE NOTICE '==> WYKONANO % na tabeli "%", produkt: "%"',
        TG_OP, TG_TABLE_NAME, nazwa_produktu;

    IF (TG_OP = 'DELETE') THEN
        RETURN OLD;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER produkty_log
AFTER INSERT OR UPDATE OR DELETE ON produkty
FOR EACH ROW
EXECUTE PROCEDURE produkty_info();


-- Dodanie nowego produktu
INSERT INTO produkty (produkt, cena) VALUES ('Chleb', 2.99);

-- komunikat
UWAGA:  ==> WYKONANO INSERT na tabeli "produkty", produkt: "Chleb"

-- Aktualizacja produktu
UPDATE produkty SET cena = cena + 1 WHERE produkt = 'Chleb';

-- komunikat
UWAGA:  ==> WYKONANO UPDATE na tabeli "produkty", produkt: "Chleb"

-- Usunięcie produktu
DELETE FROM produkty WHERE produkt = 'Chleb';

-- komunikat
UWAGA:  ==> WYKONANO DELETE na tabeli "produkty", produkt: "Chleb"