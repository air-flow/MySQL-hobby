create table test_INSTANT(
    a int primary key auto_increment,
    b char(8) not null ,
    c int not null
);

alter table test_INSTANT add column d int, algorithm=instant;
ALTER TABLE test_INSTANT ADD d int AFTER b, algorithm=instant;
alter table test_INSTANT drop d, algorithm=instant;