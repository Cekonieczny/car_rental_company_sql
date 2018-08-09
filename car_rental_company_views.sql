-- count customer overall loans (zadanie g1)
CREATE OR REPLACE VIEW customer_count_loans AS
SELECT
    c.name name,c.surname surname, COUNT(l.customer_id) cnt
FROM
    loan l
JOIN
	customer c
ON
	customer_id = c.id
GROUP BY customer_id;
-- count customer loan in certain month and year (zadanie g3)
CREATE or replace VIEW customer_loan_monthandyear AS
    SELECT
     c.name name,c.surname surname, c.id id, MONTHNAME(date_from)as `Month of loan`, year(date_from)as `Year of loan`, COUNT(l.customer_id)cnt
FROM loan l
JOIN
	customer c
ON
	customer_id = c.id
GROUP BY id, month(date_from),year(date_from);
-- count number of distinct cars loaned by a customer (h)
CREATE or replace VIEW distinct_car_for_each_customer AS
SELECT 
            c.name name, c.surname surname, COUNT(DISTINCT car.id) cnt
        FROM
            loan
        JOIN car ON car_id = car.id
        JOIN customer c ON customer_id = c.id
        GROUP BY customer_id;
-- count how often is certain car brand loaned (zadanie i)
CREATE or replace VIEW count_car_brands AS
SELECT 
    car.brand brand, COUNT(car.brand) cnt
FROM
    loan l
        JOIN
    car ON l.car_id = car.id
GROUP BY car.brand;
-- show sums of money paid by customer in a current year (zadanie j)
CREATE or replace VIEW currentyear_prices_of_loans_sums AS
SELECT t.name,t.surname, SUM(t.price) pricesum, t.loan_year loan_year FROM(
SELECT 
	c.name name, c.surname surname, l.price price, year(l.date_from) as loan_year,l.customer_id customer_id
FROM loan l
JOIN customer c on customer_id = c.id
HAVING loan_year = year(CURDATE()))as t
GROUP BY t.customer_id;
-- count how many times did customers return the car in a different office than the one they rented it from  (zadanie m)
CREATE OR REPLACE VIEW count_customer_different_offices_loans AS
    SELECT 
        c.name name, c.surname surname, c.address address, c.phone_number phonenumber, t1.cnt cnt 
    FROM
        customer c
            JOIN
        (SELECT 
            t2.customer_id customer_id, COUNT(customer_id) cnt
        FROM
            (SELECT 
            customer_id
        FROM
            loan
        WHERE
            office_from_id != office_to_id) AS t2
        GROUP BY customer_id)as t1 ON t1.customer_id = c.id;
-- count e-mails by domain (zadanie n)
CREATE OR REPLACE VIEW  count_email_by_domain AS 
select substr(email, instr(email, '@') + 1) as domain, count(*) cnt
from customer
group by substr(email, instr(email, '@') + 1);