/*
 * Program 1: Displays data of all the transactions of a given customer.
 *  For each transaction, the data to display includes: vendor name, date, and amount.
 *  Write the program as a function that accepts a customer name as a parameter, and displays transactions of the customer. (1%)
 */

create or replace function q01(name char) returns void as $$
    declare
        c1 cursor for select vname, t_date, amount from customer natural join transaction natural join vendor where cname=name;
        vendor_name char(20);
        trans_date date;
        trans_amount numeric(10,2);

    begin
        open c1;
        loop
            fetch c1 into vendor_name, trans_date, trans_amount;
            exit when not found;

            raise notice 'Vendor Name: %', vendor_name;
            raise notice 'Transaction Date: %', trans_date;
            raise notice 'Transaction Amount: %', trans_amount;
            raise notice '';
        end loop;
        close c1;
    end;

    --return query select vname, t_date, amount from customer natural join transaction natural join vendor where cname=name;
$$ language plpgsql;
