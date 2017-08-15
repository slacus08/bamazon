DROP TABLE IF EXISTS products;

CREATE TABLE products (
	item_id INT NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(40) NOT NULL,
	department_name VARCHAR(40)
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

INSERT INTO products (product_name, department_id, price, stock_quantity, product_sales)
VALUES ("Amazon Echo", 1, 159.00, 5000, 1000);

INSERT INTO products (product_name, department_id, price, stock_quantity, product_sales)
VALUES ("Sauce Pan", 2, 29.00, 2000, 500);

INSERT INTO products (product_name, department_id, price, stock_quantity, product_sales)
VALUES ("Mascara", 5, 49.00, 1000, 250);

INSERT INTO products (product_name, department_id, price, stock_quantity, product_sales)
VALUES ("Dog food", 4, 159.00, 5000, 1000);

INSERT INTO products (product_name, department_id, price, stock_quantity, product_sales)
VALUES ("Squeak toy", 4, 159.00, 5000, 1000);
