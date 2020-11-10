# A3 - PostgreSQL Database for Tiny Credit Card Company

- @author Mitchell Van Braeckel (mvanbrae@uoguelph.ca) 1002297
- @course CIS*3530: Data Base Systems & Concepts - A3
- @version 10/11/2020
- @file README
- @brief Uses PostgreSQL to create tables and perform operations for a database that represents a tiny credit card company, where tables store data of customers, vendors, and transactions (Data Base Systems & Concepts course A3)
- @note use `ssh mvanbrae@linux.socs.uoguelph.ca` to connect, where files are in `cis3530/a3/`; then use `psql -h db` (actually use `psql -h db -d mvanbrae -U mvanbrae`?) to connect to PostgreSQL database to test things
  - use `kinit` and enter central login ID password if error like the following occurs when trying to connect:

```text
psql: GSSAPI continuation error: Unspecified GSS failure.  Minor code may provide more information
GSSAPI continuation error: No Kerberos credentials available (default cache: FILE:/tmp/krb5cc_0000)
```

  - example of how to use stuff (via a personal GitHub transfer, push from local, pull on SoCS machine):

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
CREATE TABLE
CREATE TABLE
CREATE TABLE
```

### p1.sql

Usage: `\i f01.sql` (psql command), then `select func1();` (SQL command)

> To execute a function within a file, it will say CREATE FUNCTION after creating it (using the first command)

```text
EXAMPLE OUTPUT
```
