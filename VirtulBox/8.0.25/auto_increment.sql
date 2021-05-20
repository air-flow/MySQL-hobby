show tables;

create table auto(id int primary key auto_increment , s char(1));

 insert into auto (s) values ("A");
  insert into auto (s) values ("B");
   insert into auto (s) values ("C");
   select * from auto a ;
   commit;
show create table auto;
delete from auto where id  = 3;
alter table auto auto_increment = 1;