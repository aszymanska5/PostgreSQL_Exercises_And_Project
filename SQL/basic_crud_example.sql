create table nowe_osoby (
	imie VARCHAR(50),
	nazwisko VARCHAR(50),
	email VARCHAR(50),
	plec VARCHAR(50),
	data_ur DATE,
	kraj VARCHAR(50),
	zarobki DECIMAL(7,2),
	id_auta INT
);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Laetitia', 'Gladman', 'lgladman0@ibm.com', 'Female', '15/04/2005', 'China', 7708.42, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Hale', 'Stickels', 'hstickels1@narod.ru', 'Male', '01/01/2018', 'Ukraine', 7409.13, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Vernice', 'Tomalin', 'vtomalin2@prweb.com', 'Female', '09/02/1968', 'Philippines', 2259.6, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Chico', 'Tippin', 'ctippin3@ebay.co.uk', 'Male', '07/12/2017', 'China', 4023.62, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Jannel', 'Spilstead', 'jspilstead4@msu.edu', 'Female', '09/04/1997', 'Sweden', 6937.34, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Gerhard', 'Gosker', 'ggosker5@paypal.com', 'Male', '18/03/1976', 'Argentina', 1312.1, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Kaila', 'Angear', 'kangear6@last.fm', 'Female', '07/06/1989', 'China', 9021.55, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Abelard', 'Brackley', 'abrackley7@discovery.com', 'Male', '07/12/1978', 'Uruguay', 2344.86, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Welbie', 'Sherratt', 'wsherratt8@photobucket.com', 'Male', '29/05/2000', 'Czech Republic', 8388.79, null);
insert into nowe_osoby (imie, nazwisko, email, plec, data_ur, kraj, zarobki, id_auta) values ('Livia', 'Nouch', 'lnouch9@webnode.com', 'Female', '27/01/2005', 'Colombia', 5279.28, null);

update nowe_osoby set imie='Maya' where imie='Livia';
delete from nowe_osoby where email like '%.com';