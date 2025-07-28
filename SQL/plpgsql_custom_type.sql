CREATE TYPE starszy_niz AS
(nazwisko varchar(50),
d_starszy bool);

CREATE FUNCTION f_starszy(data_ref date)
RETURNS SETOF starszy_niz AS
$BODY$
DECLARE
w osoby%rowtype;
BEGIN
FOR w IN SELECT * FROM osoby LOOP
IF w.data_ur < data_ref THEN
RETURN QUERY (SELECT w.Nazwisko AS Nazwisko,
true AS d_starszy);
ELSE
RETURN QUERY (SELECT w.Nazwisko AS Nazwisko,
false AS d_starszy);
END IF;
END LOOP;
RETURN;
END;
$BODY$
LANGUAGE plpgsql VOLATILE;

SELECT * FROM f_starszy('2010-01-01');