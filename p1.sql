/*
 * Program 1: Displays data of all the transactions of a given customer.
 *  For each transaction, the data to display includes: vendor name, date, and amount.
 *  Write the program as a function that accepts a customer name as a parameter, and displays transactions of the customer. (1%)
 */

create or replace function q01(name char) returns void as $$ 
	begin 
        return query select vname, t_date, amount from c natural join t where cname=name;
	end; 
$$ language plpgsql;
