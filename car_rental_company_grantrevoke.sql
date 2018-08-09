drop user 'user_ro', 'user_rw_customer','user_admin';
flush privileges;
CREATE USER 'user_ro','user_rw_customer','user_admin' IDENTIFIED BY 'password';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user_ro', 'user_rw', 'user_admin';

GRANT ALL PRIVILEGES ON car_rental_company.* TO 'user_admin';
GRANT SELECT ON car_rental_company.* TO 'user_ro';
GRANT SELECT ON car_rental_company.* TO 'user_rw_customer';
GRANT UPDATE,INSERT,DELETE ON car_rental_company.customer TO 'user_rw_customer';