/*
 * Write a PostgreSQL program/script to create the three tables with names: vendor, customer, and transaction;
 *  specify the vendor number, account number and transaction number as the PRIMARY KEYs respectively.
 * Insert data into the tables (2%), where the data are those on the eighth page of the Lecture 4.1 SQL course notes.
 *  Use the PostgreSQL date format to store dates.
 */

-- | **Vno** | Vname | City | Vbalance |
-- |---------|-------|------|----------|
-- | V1 | IKEA | Toronto | 200.00 |
-- | V2 | Walmart | Waterloo | 671.05 |
-- | V3 | Esso | Windsor | 0.00 |
-- | V4 | Esso | Waterloo | 225.00 |

-- | **Account** | Cname | Province | Cbalance | Crlimit |
-- |-------------|-------|----------|----------|---------|
-- | A1 | Smith | ONT | 2515.00 | 2000 |
-- | A2 | Jones | BC | 2014.00 | 2500 |
-- | A3 | Doc | ONT | 150.00 | 1000 |

-- | **Tno** | Vno | Account | T_date | Amount |
-- |---------|-----|---------|--------|--------|
-- | T1 | V2 | A1 | 2020-07-15 | 1325.00 |
-- | T2 | V2 | A3 | 2019-12-16 | 1900.00 |
-- | T3 | V3 | A1 | 2020-09-01 | 2500.00 |
-- | T4 | V4 | A2 | 2020-03-20 | 1613.00 |
-- | T5 | V4 | A3 | 2020-07-31 | 2212.00 |

-- drop tables first
DROP TABLE IF EXISTS vendor;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS transaction;

-- create tables
CREATE TABLE IF NOT EXISTS vendor (Vno CHAR(5), Vname CHAR(20), City CHAR(10), Vbalance NUMERIC(10,2), PRIMARY KEY(Vno));
CREATE TABLE IF NOT EXISTS customer (Account CHAR(5), Cname CHAR(20), Province CHAR(5), Cbalance NUMERIC(10,2), Crlimit INT, PRIMARY KEY(Account));
CREATE TABLE IF NOT EXISTS transaction (Tno CHAR(5), Vno CHAR(5), Account CHAR(5), T_date DATE, Amount NUMERIC(10,2), PRIMARY KEY(Tno));

-- insert data into each table
INSERT INTO vendor VALUES ('V1', 'IKEA', 'Toronto', 200.00);
INSERT INTO vendor VALUES ('V2', 'Walmart', 'Waterloo', 671.05);
INSERT INTO vendor VALUES ('V3', 'Esso', 'Windsor', 0.00);
INSERT INTO vendor VALUES ('V4', 'Esso', 'Waterloo', 225.00);

INSERT INTO customer VALUES ('A1', 'Smith', 'ONT', 2515.00, 2000);
INSERT INTO customer VALUES ('A2', 'Jones', 'BC', 2014.00, 2500);
INSERT INTO customer VALUES ('A3', 'Doc', 'ONT', 150.00, 1000);

INSERT INTO transaction VALUES ('T1', 'V2', 'A1', '2020-07-15', 1325.00);
INSERT INTO transaction VALUES ('T2', 'V2', 'A3', '2019-12-16', 1900.00);
INSERT INTO transaction VALUES ('T3', 'V3', 'A1', '2020-09-01', 2500.00);
INSERT INTO transaction VALUES ('T4', 'V4', 'A2', '2020-03-20', 1613.00);
INSERT INTO transaction VALUES ('T5', 'V4', 'A3', '2020-07-31', 2212.00);
