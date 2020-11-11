/*
 * Program 6: Charges each vendor a service fee that is 4% of the vendor's balance, and subtracts the service fee from the balance.
 *  The program then displays the name of each vendors, the fee charged, and the new balance. (2%)
*/

create or replace function q06() returns void as $$
    declare
        c1 cursor for select vno from vendor;
        v_num char(5);
        v_name char(20);
        v_bal NUMERIC(10,2);
        service_charge NUMERIC(10,2);
        new_bal NUMERIC(10,2);
        
    begin
        open c1;
        loop
            fetch c1 into v_num;
            exit when not found;

            select vname, vbalance into v_name, v_bal from vendor where vno=v_num;
            service_charge := 0.04 * v_bal;
            new_bal := v_bal - service_charge;
            update vendor set vbalance = new_bal where vno=v_num;

            raise notice '% % %', v_name, service_charge, new_bal;
        end loop;
        close c1;
    end;
$$ language plpgsql;
