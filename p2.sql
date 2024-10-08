/*
 * Program 2: Displays data of the customers who have transactions with a given vendor.
 *  The data include customer numbers, customer names, and provinces.
 *  Write the program as a function that accepts a vendor name as a parameter and displays data of customers. (1%)
 */

create or replace function q02(name char) returns table (cust_acc CHAR(5), cust_name CHAR(20), cust_prov CHAR(5)) as $$
    begin
        return query
        select account, cname, province
        from customer natural join transaction natural join vendor
        where vname=name;
    end;
$$ language plpgsql;
