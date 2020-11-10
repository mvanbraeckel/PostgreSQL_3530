create table if not exists vendor (Vno char(5), Vname char(20), City char (10), Vbalance numeric(10,2), primary key (Vno));
create table if not exists customer (Account char(5), Cname char(20), Province char (5), Cbalance numeric(10,2), Crlimit int(20), primary key (Account));
create table if not exists transaction (Tno char(5), Vno char(5), Account char (5), T_date date, Amount numeric(10,2), primary key (Tno));
