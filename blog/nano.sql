create table nano(id int primary key auto_increment ,create_at TIMESTAMP(6) );
insert into nano(create_at) values('2022-05-15 12:34:56.1234567');
insert into nano(create_at) values('2022-05-15 12:34:56.1234567');
insert into nano(create_at) values('2022-05-15 12:34:56.1234567');
insert into nano(create_at) values(FROM_UNIXTIME(UNIX_TIMESTAMP(now()) + RAND()));

(root@localhost) [test] 8.0.29 > select ;
+-----------------------------------------------+
| FROM_UNIXTIME(UNIX_TIMESTAMP(now()) + RAND()) |
+-----------------------------------------------+
| 2022-05-18 07:11:39.975426                    |
+-----------------------------------------------+
1 row in set (0.00 sec)

create table roku(id int primary key auto_increment ,create_at TIMESTAMP(6) );
insert into roku(create_at) values(FROM_UNIXTIME(UNIX_TIMESTAMP(now()) + RAND()));
create index id_index on roku(create_at);
explain select * from roku where create_at < '2022-05-15 12:34:56.1234567';
(root@localhost) [test] 8.0.29 > explain select * from roku where create_at < '2022-05-15 12:34:56.1234567';
+----+-------------+-------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+
| id | select_type | table | partitions | type  | possible_keys | key      | key_len | ref  | rows | filtered | Extra                    |
+----+-------------+-------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+
|  1 | SIMPLE      | roku  | NULL       | index | id_index      | id_index | 8       | NULL |    1 |   100.00 | Using where; Using index |
+----+-------------+-------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+
1 row in set, 1 warning (0.01 sec)

create table nana(id int primary key auto_increment ,create_at TIMESTAMP(7) );
insert into nana(create_at) values(FROM_UNIXTIME(UNIX_TIMESTAMP(now()) + RAND()));
create index id_index on nana(create_at);
explain select * from nana where create_at < '2022-05-15 12:34:56.1234567';
insert into roku(create_at) select FROM_UNIXTIME(UNIX_TIMESTAMP(now()) + RAND()) from roku limit 100000;

SELECT table_name, 
       engine, 
       table_rows ,
       avg_row_length ,
       TABLE_SCHEMA,
       floor((data_length+index_length) / 1024 / 1024) AS ALL_MB,
       floor(data_length / 1024 / 1024) AS DATA_MB,
       floor(index_length / 1024 / 1024) AS INDEX_MB
FROM information_schema.tables
ORDER BY (data_length + index_length) DESC limit 10;