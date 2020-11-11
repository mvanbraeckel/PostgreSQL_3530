/*
 * Program 3: Inserts a new customer record (tuple).
 *  Write this program as a function, which takes data of the customer as parameters and stores the data into the customer table.
 *  It then displays all the customer records, where the balance of the new customer should be zero (0.00). (2%)
 */

-- This function displays vno of the vendor whose name and city are
-- passed as parameters.

create or replace function q03(name char, prov char, cr_limit int) returns table (Account CHAR(5), Cname CHAR(20), Province CHAR(5), Cbalance NUMERIC(10,2), Crlimit INT) as $$
    declare
        acc = char(5);
        id int := 1;

    begin
        loop
            if exists(select account from customer where account=('A' || id)) then
                acc := 'A' || id;
                raise notice 'new acc = %', acc;
                exit;
            else
                id := id + 1;
            end if;
        end loop;

        insert into customer values (acc, name, prov, 0.00, cr_limit);

        return query select * from customer;
    end;
$$ language plpgsql;
