.read data.sql


CREATE TABLE average_prices AS
  SELECT category, avg(MSRP) AS average_price 
  FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) as price
  FROM inventory GROUP BY item;

CREATE TABLE information AS
  SELECT category, name, rating, store, price
  FROM products, lowest_prices
  WHERE name = item;

CREATE TABLE temp AS
  SELECT name, store, min(price / rating) 
  FROM information GROUP BY category;
  
CREATE TABLE shopping_list AS
  SELECT name, store FROM temp;

CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs)
  FROM stores, shopping_list
  WHERE stores.store = shopping_list.store;

