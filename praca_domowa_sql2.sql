


/*   1.Policzyć liczbę wniosków oraz średnią kwotę rekompensaty
 w agregacji kod krju i powód operatora. Posortować malejąco po średniej kwocie i wyświetlić tylko takie pozycje ,
  które mają więcej niż 10 wniosków.
  */
select kod_kraju, powod_operatora, kwota_rekompensaty, count(1)
from wnioski
group by  kod_kraju, powod_operatora, kwota_rekompensaty
having count(1)>10
order by (kwota_rekompensaty) desc ;



/*     2. Policzyć ile w każdym roku było wniosków,
których źródłem polecenia był facebook lub twitter ( 1 wynik)
 oraz takich, które były wypłacone z powodu pogody (2 wynik)
Chcę żeby 2 te wyniki znalazły się w 1 wierszu wynikowym.
Podpowiedź można zastosować składnię: sum( case when … end) */


select to_char (data_utworzenia,'YYYY'), zrodlo_polecenia,powod_operatora, count(1)
from wnioski
where zrodlo_polecenia ='fb / twitter' and powod_operatora ='pogoda'
group by 1,2,3;



/Zad.3. *Wyliczyć liczbę wniosków z kwotą rekompensaty
 pomiędzy 500 a 1000 w agregacji na język – polski, angielsk, niemieci i inny
 oraz kategorię opóźnienia. Posortować rosnąco po kategorii opóźnienia
  a następnie po liczbie wniosków.
  */
select id, kwota_rekompensaty, jezyk, opoznienie, count(1) from wnioski
where kwota_rekompensaty between 500 and 1000
group by 1,2,3,4
having jezyk in ('pl','en', 'de','inny')
order by opoznienie, count(id) asc ;


