/*
 * Program 4: Displays the most recent transaction of every customer.
 *  The program displays account number, customer name, amount, and vendor name.
 *  If a customer has no transaction (e.g. the new one), the program should display "no transaction". (2%)
 */

create or replace function q04() returns void as $$
    declare
        c1 cursor for select account from customer;
        acc char(5);
        c_acc char(5);
        c_name char(20);
        t_amt numeric(10,2);
        v_name char(20);

    begin
        open c1;
        loop
            fetch c1 into acc;
            exit when not found;

            if exists(select t_date from customer natural join transaction where account=acc) then
                select account, cname, amount, vname into c_acc, c_name, t_amt, v_name
                from customer natural join transaction natural join vendor where t_date = (
                    select max(t.t_date) from customer as c natural join transaction as t where c.account=acc
                );
                raise notice '% % % %', c_acc, c_name, t_amt, v_name;
            else
                select account, cname into c_acc, c_name from customer where account=acc;
                raise notice '% % "no transaction"', c_acc, c_name;
            end if;
        end loop;
        close c1;
    end;
$$ language plpgsql;
