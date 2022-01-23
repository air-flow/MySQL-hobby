CREATE TABLE parents (
  parent_id int(10)  primary key AUTO_INCREMENT,
  parent_idx_col int(10)  NOT NULL
);
CREATE TABLE children (
  child_id int(10)  primary key   AUTO_INCREMENT ,
  parent_id int(10)  NOT NULL,
  KEY fk_parent_id (parent_id),
  CONSTRAINT fk_parent_id FOREIGN KEY (parent_id) REFERENCES parents (parent_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
insert into parents(parent_idx_col) SELECT CEIL(RAND() * 100) from  performance_schema.events_errors_summary_by_thread_by_error;


63504 rows in set (0.01 sec)

mysql> truncate table parents;
ERROR 1701 (42000): Cannot truncate a table referenced in a foreign key constraint (`hobby`.`children`, CONSTRAINT `fk_parent_id`)
mysql> insert into children(parent_id) SELECT CEIL(RAND() * 100) from  performance_schema.events_errors_summary_by_thread_by_error limit 10;

select * from parents inner join children on parent_idx_col = children.parent_id limit 10;

select * from children inner join parents on parent_idx_col = children.parent_id limit 10;

select * from parents inner join children on parent_idx_col = children.parent_id order by parents.parent_id asc ;
select * from children inner join parents on  children.parent_id = parent_idx_col order by parents.parent_id asc ;

select * from children right outer join parents on  children.parent_id = parent_idx_col order by parents.parent_id asc ;
select * from parents left outer join children on parent_idx_col = children.parent_id order by parents.parent_id asc ;
