DELIMITER //
CREATE TRIGGER ins_price BEFORE INSERT ON car_rental_company.loan FOR EACH ROW
BEGIN
   IF NEW.price < 100 THEN
   SET NEW.price = 100;
	END IF;
    END;
delimiter;

DELIMITER //
CREATE TRIGGER update_price BEFORE UPDATE ON car_rental_company.loan FOR EACH ROW
BEGIN
   IF NEW.price < 100 THEN
   SET NEW.price = 100;
	END IF;
    END;
delimiter;