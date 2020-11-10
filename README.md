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

Usage: `\i create.sql`

> Creates the tables and inserts the data

```text
EXAMPLE OUTPUT
```

### p1.sql

Usage: `\i f01.sql` (psql command), then `select func1();` (SQL command)

> To execute a function within a file, it will say CREATE FUNCTION after creating it (using the first command)

```text
EXAMPLE OUTPUT
```
