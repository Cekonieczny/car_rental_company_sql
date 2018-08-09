-- CHECK UPDATE TRIGGER
UPDATE loan 
SET 
    price = 20
WHERE
    id = 1;

SELECT price FROM loan WHERE id = 1;

-- CHECK INSERT TRIGGER
INSERT INTO 
loan(office_from_id,office_to_id,car_id,customer_id, date_from,date_to,price)
VALUES(3,2,2,1,'2016-05-01','2016-05-12',99);

SELECT price FROM loan WHERE id = (SELECT(MAX(id))FROM loan);
DELETE FROM loan WHERE id = (SELECT MAX(id) FROM loan);