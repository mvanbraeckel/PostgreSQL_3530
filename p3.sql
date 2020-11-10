

-- This function displays vno of the vendor whose name and city are 
-- passed as parameters.

create or replace function q03(name char, vcity char) returns void as $$ 
    declare 
        vendor_num char(10); 
    begin 
        select vno into vendor_num from vendor 
            where vname = name and city = vcity; 
        raise notice 'Vendor number is: %', vendor_num; 
    end; 
$$ language plpgsql;
