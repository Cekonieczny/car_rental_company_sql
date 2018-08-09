-- insert offices
INSERT INTO 
office(address, phone_number) 
VALUES ('Poznanska 54, Kalisz', '+48222333444'),
('Kaliska 23, Poznan', '+48333444555'),
('Debowa 55, Gdańsk', '+48444555666');
-- insert company_positions
INSERT INTO 
company_position (name) 
VALUES
('Dyrektor'),
('Kierownik'),
('Manager'),
('Młodszy sprzedawca'),
('Starszy sprzedawca');
-- insert employees
INSERT INTO 
employee(name,surname,birth_date, office_id, company_position_id) 
VALUES ('Maciej','Maciejewski','1994-05-01',1,3),
('Paweł','OFowski','1994-05-01',1,2),
('Adam','AFowski','1994-05-01',1,1),
('Piotr','Piotrowski','1990-03-01',1,5),
('Łukasz','Łukaszewski','1990-03-01',2,4),
('Tomasz','Tomaszewski','1990-05-11',2,4),
('Adam','Adamski','1990-05-11',2,3),
('Stanisław','Stanisławowski','1970-05-11',2,5),
('Zdzisław','Bąk','1960-05-11',3,4),
('Gerwazy','Kabłąk','1960-05-11',3,4),
('Protazy','Kabłąk','1964-05-11',3,5),
('Damazy','Kabłąk','1965-05-11',3,5);
-- insert customers
INSERT INTO 
customer(name,surname,address,email,phone_number,birth_date,credit_card_number) 
VALUES ('Jan','Wróblewski','Gdańska 20, Gdynia','komommyzu-5168@yopmail.com','+48123456789','1994-05-01','0123456789123456'),
('Karin','Wojciechowska','Gdańska 21, Gdynia','uppelladderr-8497@yopmail.com','+4812678789','1994-05-01','0121466789123456'),
( 'Maja','Stefańska','Gdańska 22, Gdynia','sunucywu-7209@yopmail.com','+48123169789','1994-05-01','0123789789123456'),
('Joanna','Jakubowska','Gdańska 23, Gdynia','zgkigvou@imgof.com','+48174026789','1990-03-01','0123456745623456'),
('Aleksandra','Szymańska','Gdańska 24, Gdynia','zgkigvou@imgof.com','+48256703789','1990-03-01','0123556789123456'),
('Alan','Świderski','Gdańska 25, Gdynia','zgkigvou@imgof.com','+48128886789','1990-05-11','0123456789663456'),
( 'Maksymilian','Czerwiński','Gdańska 26, Gdynia','maksymilian.czerwinski@gmail.com','+48121111789','1990-05-11','4423456789123456'),
('Oliwia','Stępień','Gdańska 27, Gdynia','oliwia.stepinska@gmail.com','+48222226789','1970-05-11','0123456783303856'),
('Monika','Makowska','Gdańska 28, Gdynia','monika.makowska@gmail.com','+48124357789','1960-05-11','0123452289189456'),
( 'Kacper','Piotrowski','Gdańska 29, Gdynia','kacper.piotrowski@gmail.com','+48120758789','1969-05-11','0123458909123456'),
( 'Krzysztof','Hołowczyc','Gdańska 30, Gdynia','kacper.piotrowski@gmail.com','+48120758789','1969-05-11','0123458909123456'),
( 'Adam','Małysz','Gdańska 31, Gdynia','kacper.piotrowski@gmail.com','+48120758789','1969-05-11','0123458909123456');
-- insert colors
INSERT INTO 
color(name)
VALUES
('Aquamarine'),
('Blue'),
('Green'),
('Black'),
('Silver'),
('Graphite'),
('White'),
('Red');
-- insert car_types
INSERT INTO 
car_type( name)
VALUES
('Sedan'),
('Kombi'),
('Hatchback'),
('SUV'),
('Coupe'),
('Convertible'),
('Van'),
('Bus'),
('City car');
-- insert cars
INSERT INTO 
car(mileage,brand,model,engine_capacity,horsepower,year_of_manufacture,color_id,car_type_id)
VALUES 
( 280000 ,'Opel','Astra',1399, 150, 2015, 1,1),
( 280000 ,'Opel','Insignia',1956, 195, 2012, 4,1),
( 200000 ,'Skoda','Fabia',1598, 75,2014, 2,2),
( 300000 ,'Ford','Mustang',5812, 650, 2005, 8,6),
( 111000 ,'Mercedes','S W222',3498, 306, 2015, 6,1),
( 444000 ,'Volskwagen','Caddy',1896, 104,2004, 3,8),
( 555000 ,'Volkswagen','New Beetle',1390, 75, 2002, 7,8),
( 333000 ,'BMW','X1 F48',1995, 150, 2015, 5,4),
( 123000,'Mercedes','Vito',2143, 163, 2018, 7,9),
( 51000 ,'Porsche','911 Carrera',3436, 350, 2012, 8,7);
-- insert loans
INSERT INTO 
loan(office_from_id,office_to_id,car_id,customer_id, date_from,date_to,price)
VALUES
(3,2,1,1,'2018-03-01','2018-05-12',800),
(3,1,2,2,'2018-02-15','2018-05-18',300),
(3,2,1,6,'2018-01-22','2018-08-26',350),
(2,3,1,4,'2018-08-01','2018-08-21',1200),
(2,1,3,4,'2018-05-01','2018-02-05',400),
(2,3,2,4,'2018-05-01','2018-01-10',600),
(1,1,7,3,'2018-09-22','2016-09-26',300),
(1,3,8,3,'2018-04-01','2017-04-05',300),
(3,2,10,1,'2018-05-01','2018-05-12',800),
(3,1,10,2,'2018-05-15','2018-05-18',300),
(3,2,10,6,'2018-05-22','2018-08-26',350),
(2,3,10,4,'2018-05-23','2018-05-26',1200),
(2,1,9,4,'2018-05-26','2018-05-27',400),
(2,3,9,4,'2018-05-29','2018-05-30',600),
(1,1,9,3,'2018-09-22','2016-09-26',300),
(1,3,9,3,'2018-04-01','2017-04-05',300),
(1,3,2,11,'2017-12-29','2018-01-05',300),
(1,3,2,12,'2018-04-01','2018-04-05',300);
-- insert keepers
INSERT INTO 
keeper(employee_id,car_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(3,5),
(4,6),
(4,7),
(5,8),
(2,10),
(9,10),
(1,10);