/*
 * Program 1: Displays data of all the transactions of a given customer.
 *  For each transaction, the data to display includes: vendor name, date, and amount.
 *  Write the program as a function that accepts a customer name as a parameter, and displays transactions of the customer. (1%)
 */

create or replace function q01(name char) returns table (vendor_name CHAR(20), trans_date DATE, trans_amount NUMERIC(10,2)) as $$
    begin
        return query
        select vname, t_date, amount
        from customer natural join transaction natural join vendor
        where cname=name;
    end;
$$ language plpgsql;
