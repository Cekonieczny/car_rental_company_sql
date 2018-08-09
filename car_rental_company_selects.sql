-- zadanie a)	znajdź pracowników starszych niż 25 lat
SELECT * FROM employee
WHERE YEAR(CURDATE()) - YEAR(employee.birth_date) >25
or
YEAR(CURDATE()) - YEAR(employee.birth_date) = 25
AND MONTH(CURDATE()) - MONTH(employee.birth_date)>=0
AND DAY(CURDATE()) - DAY(employee.birth_date)>=0;

-- zadanie 	 b)	znajdź pracowników, których nazwisko jest dłuższe niż N znaków – N = 5

SELECT * FROM employee
WHERE length(employee.surname)>=5;

-- zadanie c)	znajdź pracowników, w których nazwisku na drugim miejscu wystepuje duża litera 'F'

SELECT * FROM employee
WHERE employee.surname LIKE '%_F%';

-- zadanie d)	znajdź samochody z największym przebiegiem – konkretny samochód z największym przebiegiem

SELECT * FROM car
order by car.mileage DESC LIMIT 1;

-- zadanie e)	policz ilość samochodów których przebieg jest pomiędzy 200 a 300 tys.

SELECT COUNT(*) FROM car
WHERE mileage BETWEEN 200000 AND 300000;

-- zadanie f)	znajdź wszystkich kierowników

SELECT e.*, p.name position_name FROM employee e
JOIN company_position p on e.company_position_id = p.id
WHERE p.name  = 'kierownik';

-- ZADANIE G
-- zadanie g 1) znajdź klienta z największa liczbą wypożyczeń – id, imie, nazwisko;

SELECT 
    name, surname, cnt
FROM
    customer_count_loans
HAVING cnt = (SELECT 
        MAX(t.cnt)
    FROM
        customer_count_loans AS t);

-- zadanie g 2) podaj liczbę wszystkich wypożyczeń na miesiąc – tylko te, w których były jakies wypozyczenia; niezależnie od roku

SELECT
      monthname(date_from)as `Month of loan`, COUNT(l.customer_id)cnt
FROM loan l
JOIN
	customer c
ON
	customer_id = c.id
GROUP BY `Month of loan`
ORDER BY month(date_from)asc;

-- zadanie g 3) znajdź miesiąc i rok w którym każdy z klientów miał największą liczbę wypożyczeń

SELECT 
   t1.*
FROM
    customer_loan_monthandyear t1
        JOIN
    (SELECT 
        MAX(cnt) maxcnt, id
    FROM
        customer_loan_monthandyear
    GROUP BY id)t2
    ON t1.id = t2.id
    and t1.cnt = t2.maxcnt
    ORDER BY t1.cnt desc,t1.id;
    
-- zadanie g 4) dla każdego miesiąca podaj średnią liczbę wypożyczeń na klienta

SELECT 
    MONTHNAME(date_from) loanmonth, ROUND(COUNT(*) / (select count(distinct customer_id) from loan),2) average_loans
FROM
    loan
GROUP BY loanmonth
ORDER BY month(date_from)asc;

-- h)	znajdź klientów, którzy wypożyczyli największą liczbę różnych samochodów

SELECT 
     name,  surname, cnt
FROM
    distinct_car_for_each_customer
HAVING cnt = (SELECT 
        MAX(t.cnt)
    FROM
        distinct_car_for_each_customer AS t);
        
-- i)	znajdź samochody najczęściej wypożyczane – która marka była najczęściej wypożyczana

SELECT 
    brand, cnt
FROM
    count_car_brands
HAVING cnt = (SELECT 
        MAX(t.cnt)
    FROM
        count_car_brands AS t);
        
-- j)	znajdź klientów, którzy zapłacili najwięcej za wypożyczenia w tym roku

SELECT 
    name, surname, pricesum, loan_year
FROM
    currentyear_prices_of_loans_sums
HAVING pricesum = (SELECT 
        MAX(t.pricesum)
    FROM
        currentyear_prices_of_loans_sums AS t);
        
-- zadanie k
-- zadanie k 1)	znajdź klientów, którzy wypożyczyli samochód X w dacie miedzy Y a Z.

SELECT c.name, c.surname, c.address, t.carid
FROM customer c
JOIN( SELECT DISTINCT l.customer_id, l.car_id carid FROM
loan l
WHERE date_from BETWEEN '2018-01-01' AND '2019-01-01' AND l.car_id = '2')AS t
on t.customer_id = c.id;

-- zadanie k 2)	znajdź klientów, którzy mieli choć przez chwilę wypożyczony samochód X w dacie miedzy Y a Z. 
-- Proszę wziąć pod uwagę różne możliwości nakładania się terminów (!)

SELECT c.name, c.surname, c.address, t.carid
FROM customer c
JOIN( SELECT DISTINCT l.customer_id, l.car_id carid FROM
loan l
WHERE l.date_from <= '2019-01-01' AND l.date_to >= '2018-01-01' AND l.car_id = '2')AS t
on t.customer_id = c.id;

-- l)	zaktualizuj kolor samochodu X

UPDATE car 
SET 
    color_id = 1
WHERE
    id = 2;
    
-- m)	znajdź klienta, który najczęściej wypożycza i oddaje samochody w innych miejscach ; jeśli będzie kilka klientów z taką samą liczba (maxem), to chcę zobaczyć ich wszystkich

SELECT 
	name,surname, address, phonenumber, cnt 
FROM 
	count_customer_different_offices_loans 
HAVING 
	cnt = (
SELECT 
	max(t.cnt)
FROM 
	count_customer_different_offices_loans as t);
    
-- n)	sprawdź w jakiej domenie klienci maja najczęściej email – domena = wszystko co jest po znaku @

SELECT 
    domain, cnt
FROM
    count_email_by_domain
HAVING cnt = (SELECT 
        MAX(t.cnt)
    FROM
        count_email_by_domain AS t);
        
-- o)	znajdź samochody, które mają conajmniej 2 opiekunów

SELECT 
    k.car_id
FROM
    keeper k
        JOIN
    (SELECT 
        COUNT(employee_id) cnt, car_id
    FROM
        keeper
    GROUP BY employee_id) AS t ON t.cnt >= 2 AND k.car_id = t.car_id;
    
-- p)	znajdź pracowników, którzy nie opiekują się żadnym samochodem

SELECT 
    e.id, k.id
FROM
    employee e
        LEFT JOIN
    keeper k ON e.id = k.employee_id
WHERE
    k.employee_id IS NULL;





