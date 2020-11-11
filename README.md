# A3 - PostgreSQL Database for Tiny Credit Card Company

- @author Mitchell Van Braeckel (mvanbrae@uoguelph.ca) 1002297
- @course CIS*3530: Data Base Systems & Concepts - A3
- @version 10/11/2020
- @file README
- @brief Uses PostgreSQL to create tables and perform operations for a database that represents a tiny credit card company, where tables store data of customers, vendors, and transactions (Data Base Systems & Concepts course A3)
- @note personal use: `ssh userid@linux.socs.uoguelph.ca` to connect, where files are in `cis3530/a3/`; then use `psql -h db` (actually use `psql -h db -d userid -U userid`?) to connect to PostgreSQL database to test things (where userid=mvanbrae for my account)
  - Use `kinit` and enter central login ID password if error like the following occurs when trying to connect:
  - followed by example of how to use stuff (via a personal GitHub transfer, push from local, pull on SoCS machine):

```text
psql: GSSAPI continuation error: Unspecified GSS failure.  Minor code may provide more information
GSSAPI continuation error: No Kerberos credentials available (default cache: FILE:/tmp/krb5cc_0000)
```

```terminal
$ ssh mvanbrae@linux.socs.uoguelph.ca
mvanbrae@linux.socs.uoguelph.ca's password:
Linux fred 4.19.0-9-amd64 #1 SMP Debian 4.19.118-2 (2020-04-29) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue Nov 10 02:15:55 2020 from 10.131.10.70
mvanbrae@fred:~$ cd cis3530/a3/PostgreSQL_3530/
mvanbrae@fred:~/cis3530/a3/PostgreSQL_3530$ ls
README.md
mvanbrae@fred:~/cis3530/a3/PostgreSQL_3530$ psql -h db -d mvanbrae -U mvanbrae
psql (11.7 (Debian 11.7-0+deb10u1), server 9.6.19)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

mvanbrae=> exit
mvanbrae@fred:~/cis3530/a3/PostgreSQL_3530$ exit
logout
Connection to linux.socs.uoguelph.ca closed.
```

## Notes & Assumptions

## How to Use

### a3data.sql

Write a PostgreSQL program/script to create the three tables with names: *vendor*, *customer*, and *transaction*; specify the vendor number, account number and transaction number as the primary keys respectively.
Insert data into the tables ***(2%)***, where the data are those on the eighth page of the "SQL" course notes (see tables below). Note: use the PostgreSQL date format to store dates.

| **Vno** | Vname | City | Vbalance |
|---------|-------|------|----------|
| V1 | IKEA | Toronto | 200.00 |
| V2 | Walmart | Waterloo | 671.05 |
| V3 | Esso | Windsor | 0.00 |
| V4 | Esso | Waterloo | 225.00 |

| **Account** | Cname | Province | Cbalance | Crlimit |
|-------------|-------|----------|----------|---------|
| A1 | Smith | ONT | 2515.00 | 2000 |
| A2 | Jones | BC | 2014.00 | 2500 |
| A3 | Doc | ONT | 150.00 | 1000 |

| **Tno** | Vno | Account | T_date | Amount |
|---------|-----|---------|--------|--------|
| T1 | V2 | A1 | 2020-07-15 | 1325.00 |
| T2 | V2 | A3 | 2019-12-16 | 1900.00 |
| T3 | V3 | A1 | 2020-09-01 | 2500.00 |
| T4 | V4 | A2 | 2020-03-20 | 1613.00 |
| T5 | V4 | A3 | 2020-07-31 | 2212.00 |

Usage: `\i create.sql`

> Creates the tables and inserts the data - Example input, output:

```text
userid=> \i create.sql
DROP TABLE
DROP TABLE
DROP TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
userid=>
```

### p1.sql

Program 1: Displays data of all the transactions of a given customer. For each transaction, the data to display include vendor name, date, and amount. Write the program as a function that accepts a customer name as a parameter, and displays transactions of the customer. ***(1%)***

Usage: `\i p1.sql` (psql command), then `select q01('Customer-Name');` (SQL command)

> After creating the function for P1, select the function and provide a customer name as a parameter to receive table output that displays vendor name, data, and amount - Example input, output:

```text
mvanbrae=> \i p1.sql
CREATE FUNCTION
mvanbrae=> select q01('Smith')
mvanbrae-> ;
                     q01
---------------------------------------------
 ("Walmart             ",2020-07-15,1325.00)
 ("Esso                ",2020-09-01,2500.00)
(2 rows)

mvanbrae=> select q01('Jones');
                     q01
---------------------------------------------
 ("Esso                ",2020-03-20,1613.00)
(1 row)

mvanbrae=> select q01('Doc');
                     q01
---------------------------------------------
 ("Walmart             ",2019-12-16,1900.00)
 ("Esso                ",2020-07-31,2212.00)
(2 rows)

mvanbrae=>
```

### p2.sql

Program 2: Displays data of the customers who have transactions with a given vendor. The data include customer numbers, customer names, and provinces. Write the program as a function that accepts a vendor name as a parameter and displays data of customers. ***(1%)***

Usage: `\i p2.sql` (psql command), then `select q02('Vendor-Name');` (SQL command)

> After creating the function for P2, select the function and provide a vendor name as a parameter to receive table output that displays customer numbers, names, and provinces - Example input, output:

```text
mvanbrae=> \i p2.sql
CREATE FUNCTION
mvanbrae=> select q02('IKEA');
 q02
-----
(0 rows)

mvanbrae=> select q02('Walmart');
                   q02
------------------------------------------
 ("A1   ","Smith               ","ONT  ")
 ("A3   ","Doc                 ","ONT  ")
(2 rows)

mvanbrae=> select q02('Esso');
                   q02
------------------------------------------
 ("A1   ","Smith               ","ONT  ")
 ("A2   ","Jones               ","BC   ")
 ("A3   ","Doc                 ","ONT  ")
(3 rows)

mvanbrae=>
```

### p3.sql

Program 3: Inserts a new customer record (tuple). Write this program as a function, which takes data of the customer as parameters and stores the data into the customer table. It then displays all the customer records, where the balance of the new customer should be zero (0.00). ***(2%)***

Usage: `\i p3.sql` (psql command), then `select q03('Customer-Name', 'Province', credit_limit_number);` (SQL command)

> After creating the function for P3, select the function and provide a customer name, province, and credit limit as parameters to receive table output that displays all customers after adding the new customer with balance of 0.00 - Example input, output:

```text
mvanbrae=> \i p3.sql
CREATE FUNCTION
mvanbrae=> select q03('Mitchell', 'MB', 9001);
                          q03
-------------------------------------------------------
 ("A1   ","Smith               ","ONT  ",2515.00,2000)
 ("A2   ","Jones               ","BC   ",2014.00,2500)
 ("A3   ","Doc                 ","ONT  ",150.00,1000)
 ("A4   ","Mitchell            ","MB   ",0.00,9001)
(4 rows)

mvanbrae=> select q03('Grace Kim', 'ONT', 1000);
                          q03
-------------------------------------------------------
 ("A1   ","Smith               ","ONT  ",2515.00,2000)
 ("A2   ","Jones               ","BC   ",2014.00,2500)
 ("A3   ","Doc                 ","ONT  ",150.00,1000)
 ("A4   ","Mitchell            ","MB   ",0.00,9001)
 ("A5   ","Grace Kim           ","ONT  ",0.00,1000)
(5 rows)

mvanbrae=>
```

### p4.sql

Program 4: Displays the most recent transaction of every customer. The program displays account number, customer name, amount, and vendor name. If a customer has no transaction (e.g. the new one), the program should display "no transaction". ***(2%)***

Usage: `\i p4.sql` (psql command), then `select q04();` (SQL command)

> After creating the function for P4, select the function to receive a series of notices that displays each customer's most recent transaction, or their account info and "no transaction" - Example input, output:

```text
mvanbrae=> \i p4.sql
CREATE FUNCTION
mvanbrae=> select q04();
NOTICE:  A1    Smith                2500.00 Esso
NOTICE:  A2    Jones                1613.00 Esso
NOTICE:  A3    Doc                  2212.00 Esso
 q04
-----

(1 row)

mvanbrae=>
```

> If a customer without transactions is added - Example input, output:

```text
mvanbrae=> \i p3.sql
CREATE FUNCTION
mvanbrae=> select q03('Bubbles', 'KAI', 1000);
                          q03
-------------------------------------------------------
 ("A1   ","Smith               ","ONT  ",2515.00,2000)
 ("A2   ","Jones               ","BC   ",2014.00,2500)
 ("A3   ","Doc                 ","ONT  ",150.00,1000)
 ("A4   ","Bubbles             ","KAI  ",0.00,1000)
(4 rows)

mvanbrae=> \i p4.sql
CREATE FUNCTION
mvanbrae=> select q04();
NOTICE:  A1    Smith                2500.00 Esso
NOTICE:  A2    Jones                1613.00 Esso
NOTICE:  A3    Doc                  2212.00 Esso
NOTICE:  A4    Bubbles              "no transaction"
 q04
-----

(1 row)

mvanbrae=>
```

### p5.sql

Program 5: Calculates the total amount of transactions of every vendor in the transaction table, and add the total amount to the vendor's current balance. The program then displays vendor numbers, vendor names and the new balances. ***(2%)***

Usage: `\i p5.sql` (psql command), then `select q05();` (SQL command)

> After creating the function for P5, select the function to receive table output that displays each vendor's number, name, and balance (after adding the total amount of its transactions to its balance) - Example input, output:

```text
```
