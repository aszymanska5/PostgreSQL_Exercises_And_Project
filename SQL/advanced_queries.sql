a) select distinct marka, model from auta order by marka, model asc;
b) select marka, count(cena) as ilosc from auta group by marka order by ilosc desc;
c) select model from auta where model ilike 'p%' or model ilike 'c%';
d) select marka, model, min(cena) as minimalna_cena from auta group by model, marka order by marka, minimalna_cena;
e) select marka, round(avg(cena), 2) as srednia_cena from auta group by marka;
f) select marka, model, cena from auta where cena between 50000 and 100000 order by cena;
g) alter table auta add constraint unikalna_cena unique (cena);
h) alter table osoby add constraint blokada_kraj check (kraj <> 'PRC');