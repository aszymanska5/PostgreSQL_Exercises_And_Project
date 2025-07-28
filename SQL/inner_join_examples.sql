-- a) Złączenie wewnętrzne między osobami, fakturami, szczeg_faktur i produktami
SELECT o.imie, o.nazwisko, f.id_faktury, f.data_wystawienia, 
       p.produkt, p.cena, sf.ilosc
FROM osoby o
JOIN faktury f ON o.id_osoby = f.id_osoby
JOIN szczeg_faktur sf ON f.id_faktury = sf.id_faktury
JOIN produkty p ON sf.id_produktu = p.id_produktu;

-- b) Złączenie osób i faktur z obliczoną kwotą faktury
SELECT o.imie, o.nazwisko, f.id_faktury, f.data_wystawienia, 
       SUM(p.cena * sf.ilosc) AS kwota_faktury
FROM osoby o
JOIN faktury f ON o.id_osoby = f.id_osoby
JOIN szczeg_faktur sf ON f.id_faktury = sf.id_faktury
JOIN produkty p ON sf.id_produktu = p.id_produktu
GROUP BY o.imie, o.nazwisko, f.id_faktury, f.data_wystawienia;

-- c) Złączenie lewe osób i faktur
SELECT o.imie, o.nazwisko, f.id_faktury, f.data_wystawienia
FROM osoby o
LEFT JOIN faktury f ON o.id_osoby = f.id_osoby;
