/*
 * Program 3: Inserts a new customer record (tuple).
 *  Write this program as a function, which takes data of the customer as parameters and stores the data into the customer table.
 *  It then displays all the customer records, where the balance of the new customer should be zero (0.00). (2%)
 */

create or replace function q03(name char, prov char, cr_limit int) returns table (cust_acc CHAR(5), cust_name CHAR(20), cust_prov CHAR(5), cust_bal NUMERIC(10,2), cust_lim INT) as $$
    declare
        acc char(5);
        id int := 1;

    begin
        loop
            if not exists(select account from customer where account=('A' || id)) then
                acc := 'A' || id;
                --raise notice 'new acc = %', acc;
                exit;
            else
                id := id + 1;
            end if;
        end loop;

        insert into customer values (acc, name, prov, 0.00, cr_limit);

        return query select * from customer;
    end;
$$ language plpgsql;
