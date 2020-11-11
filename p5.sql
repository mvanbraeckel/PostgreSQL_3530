/*
 * Program 5: Calculates the total amount of transactions of every vendor in the transaction table,
 *  and add the total amount to the vendor's current balance.
 *  The program then displays vendor numbers, vendor names and the new balances. (2%)
*/

create or replace function q05() returns table (vendor_num CHAR(5), vendor_name CHAR(20), vendor_bal NUMERIC(10,2)) as $$
    declare
        c1 cursor for select vno from vendor;
        v_num char(5);
        total_trans int := 0;
        
    begin
        open c1;
        loop
            fetch c1 into v_num;
            exit when not found;

            select sum(amount) into total_trans from customer natural join transaction natural join vendor where vno=v_num;
            update transaction set vbalance = vbalance + total_trans where vno=v_num;

            end if;
        end loop;
        close c1;

        return query select vno, vname, vbalance from vendor;
    end;
$$ language plpgsql;
