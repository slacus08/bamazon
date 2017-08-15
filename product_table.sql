DROP TABLE IF EXISTS products;

CREATE TABLE products (
	item_id INT NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(40) NOT NULL,
	department_name VARCHAR(40) NOT NULL,
  price INT NOT NULL,
	stock_quantity INT NOT NULL,
	PRIMARY KEY(item_id)
	);

/*
Electronics - 1
Home - 2
Athletics -3
Pet - 4
Cosmetics - 5
*/

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Amazon Echo", "Electronics", 159.00, 5000);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sauce Pan", "Home", 29.00, 2000);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Mascara", "Cosmetics", 49.00, 1000);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Dog food", "Pet", 39.00, 5000);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Squeak toy", "Pet", 9.00, 5000);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sneakers", "Athletics", 99.00, 1000);


CREATE TABLE departments (
department_id INTEGER(11) AUTO_INCREMENT NOT NULL,
department_name VARCHAR(200) NOT NULL,
over_head_costs DECIMAL(11,2) NOT NULL,
PRIMARY KEY(department_id)
)
