
-- This function adds 100 to the balance of each customer who has more than 
-- one transection, and takes away 100 from the balance of each of the other 
-- customers. It then displays account number, name and new balance of each 
-- customer. 
-- In this function, ”return” is used for output.

/*
-- In this function, ”raise notice” is used for output.
*/

create or replace function q05() returns void as $$
	declare 
        c1 cursor for select account, count(*) from t group by account;
        c2 cursor for select account, cname, cbalance from c; 
        acc char(10); 
        num_trans integer;
        cust_acc char(10); 
        cust_name char(10); 
        cust_balance real;
        
    begin 
		open c1; 
		loop 
			fetch c1 into acc, num_trans; 
			exit when not found; 
			if (num_trans>1) then 
				update c set cbalance = cbalance + 100 
					where account = acc; 
			else 
				update c set cbalance = cbalance - 100 
				    where account = acc; 
			end if; 
		end loop; 
		close c1;

    return query select account, cname, cbalance from c; 
	end; 
$$ language plpgsql;

/*
        open c2; 
		loop 
			fetch c2 into cust_acc, cust_name, cust_balance; 
			exit when not found; 
			raise notice 'Account: %', cust_acc; 
			raise notice 'Customer name: %', cust_name; 
			raise notice 'New balance: %', cust_balance; 
			raise notice ' '; 
		end loop; 
		close c2;
	end; 
$$ language plpgsql;
*/
