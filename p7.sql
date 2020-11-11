/*
 * Program 7: Charges a service fee for each customer whose current balance is greater than the credit limit and add the charge to the balance.
 *  The service fee is 10% of the portion over the credit limit.
 *  The program then displays the name of each of such customers and the new balance. (3%)
*/

create or replace function q07() returns table (cust_name CHAR(20), cust_bal NUMERIC(10,2)) as $$
    declare
        c1 cursor for select account from customer;
        acc char(5);
        c_name char(20);
        c_bal numeric(10,2);
        c_limit int;
        new_bal numeric(10,2);
        
    begin
        open c1;
        loop
            fetch c1 into acc;
            exit when not found;

            select cname, cbalance, crlimit into c_name, c_bal, c_limit from customer where account=acc;

            if c_bal > c_limit then
                new_bal := c_bal + 0.1 * (c_bal - c_limit);
                update customer set cbalance = new_bal where account=acc;

                raise notice '% %', c_name, new_bal;
            end if;
        end loop;
        close c1;

        return query select cname, cbalance from customer where cbalance > crlimit;
    end;
$$ language plpgsql;
