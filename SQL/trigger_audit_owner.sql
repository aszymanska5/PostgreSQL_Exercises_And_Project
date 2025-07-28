CREATE TABLE samochody (
	id_auta SERIAL NOT NULL PRIMARY Key,
	marka_auta VARCHAR(50),
	model_auta VARCHAR(50),
	rok_auta VARCHAR(50),
	wlasciciel VARCHAR(50)
);
CREATE TABLE auta_zmiany (
	id_zmiany SERIAL NOT NULL PRIMARY KEY,
	id_auta INT NOT NULL, 
	wlasciciel VARCHAR(50) NOT NULL,
	termin_zmiany TIMESTAMP(6) NOT NULL
)

CREATE OR REPLACE FUNCTION log_zmiana_wlasciciela()
RETURNS trigger AS
$BODY$
BEGIN
IF NEW.wlasciciel <> OLD.wlasciciel THEN
INSERT INTO auta_zmiany(id_auta,wlasciciel,
termin_zmiany)
VALUES(OLD.id_auta,OLD.wlasciciel,now());
END IF;
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER zmiana_wlasciciela
BEFORE UPDATE
ON samochody
FOR EACH ROW
EXECUTE PROCEDURE log_zmiana_wlasciciela ();

UPDATE samochody
SET wlasciciel = 'Kowalska'
WHERE id_auta = 1;