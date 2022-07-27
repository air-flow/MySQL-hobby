CREATE TABLE t0 (
    id int PRIMARY KEY AUTO_INCREMENT,
    t1_id int NOT NULL,
    t2_id int NOT NULL,
    t3_id int NOT NULL,
    created_at date NOT NULL,
    CONSTRAINT fk_t1_id FOREIGN KEY (t1_id) REFERENCES t1 (t1_id),
    CONSTRAINT fk_t2_id FOREIGN KEY (t2_id) REFERENCES t2 (t2_id),
    CONSTRAINT fk_t3_id FOREIGN KEY (t3_id) REFERENCES t3 (t3_id)
);

INSERT INTO
    t0(t1_id, t2_id, t3_id, created_at)
SELECT
    CEIL(RAND() * 10000),
    CEIL(RAND() * 100000),
    CEIL(RAND() * 3),
    ADDDATE('1950-01-01', 50000 * rand())
FROM
    roku
LIMIT
    1000000;

CREATE TABLE t1(t1_id int PRIMARY KEY AUTO_INCREMENT);

INSERT INTO
    t1
SELECT
    0
FROM
    performance_schema.events_errors_summary_by_thread_by_error
LIMIT
    10000;

CREATE TABLE t2(t2_id int PRIMARY KEY AUTO_INCREMENT);

INSERT INTO
    t2
SELECT
    0
FROM
    roku
LIMIT
    100000;

CREATE TABLE t3(t3_id int PRIMARY KEY AUTO_INCREMENT);

INSERT INTO
    t3
SELECT
    0
FROM
    performance_schema.events_errors_summary_by_thread_by_error
LIMIT
    3;

INSERT INTO
    t3
SELECT
    CEIL(RAND() * 10000)
FROM
    performance_schema.events_errors_summary_by_thread_by_error
LIMIT
    3;

SELECT
    table_name,
    ENGINE,
    table_rows,
    avg_row_length,
    floor((data_length + index_length) / 1024 / 1024) AS ALL_MB,
    floor(data_length / 1024 / 1024) AS DATA_MB,
    floor(index_length / 1024 / 1024) AS INDEX_MB
FROM
    information_schema.tables
ORDER BY
    (data_length + index_length) DESC
LIMIT
    10;

ALTER TABLE
    t2 AUTO_INCREMENT = 1;

EXPLAIN
SELECT
    /*+
     JOIN_ORDER(t2, t1, t3)
     */
    t0.*
FROM
    t0 -- 件数多め（全部で100万レコードくらい）
    JOIN t1 -- 件数やや多め（全部で1万レコードくらい）
    ON t0.t1_id = t1.t1_id
    JOIN t2 -- 件数やや多め（全部で10万レコードくらい）
    ON t0.t2_id = t2.t2_id
    JOIN t3 -- 件数少なめ（全部で3レコードくらい）
    ON t0.t3_id = t3.t3_id
WHERE
    t0.created_at BETWEEN '1981-04-01'
    AND '2050-03-31'
ORDER BY
    t0.created_at
LIMIT
    30;

explain FORMAT=TREE
SELECT
    t0.*
FROM
    t0 -- 件数多め（全部で100万レコードくらい）
    JOIN t1 -- 件数やや多め（全部で1万レコードくらい）
    ON t0.t1_id = t1.t1_id
    JOIN t2 -- 件数やや多め（全部で10万レコードくらい）
    ON t0.t2_id = t2.t2_id
    JOIN t3 -- 件数少なめ（全部で3レコードくらい）
    ON t0.t3_id = t3.t3_id
WHERE
    t0.created_at BETWEEN '1940-04-01'
    AND '2085-03-31'
ORDER BY
    t0.created_at
LIMIT
    30;

SELECT
    /*+
     JOIN_FIXED_ORDER(t2, t1, t3)
     */
    t0.*
FROM
    t0 -- 件数多め（全部で100万レコードくらい）
    JOIN t1 -- 件数やや多め（全部で1万レコードくらい）
    ON t0.t1_id = t1.t1_id
    JOIN t2 -- 件数やや多め（全部で10万レコードくらい）
    ON t0.t2_id = t2.t2_id
    JOIN t3 -- 件数少なめ（全部で3レコードくらい）
    ON t0.t3_id = t3.t3_id
WHERE
    t0.created_at BETWEEN '1940-04-01'
    AND '2085-03-31'
ORDER BY
    t0.created_at
LIMIT
    30;

explain FORMAT=TREE
SELECT
    /*+
     JOIN_FIXED_ORDER()
     */
    t0.*
FROM
    t0 -- 件数多め（全部で100万レコードくらい）
    JOIN t1 -- 件数やや多め（全部で1万レコードくらい）
    ON t0.t1_id = t1.t1_id
    JOIN t2 -- 件数やや多め（全部で10万レコードくらい）
    ON t0.t2_id = t2.t2_id
    JOIN t3 -- 件数少なめ（全部で3レコードくらい）
    ON t0.t3_id = t3.t3_id
WHERE
    t0.created_at BETWEEN '1940-04-01'
    AND '2085-03-31'
ORDER BY
    t0.created_at
LIMIT
    30;

SELECT
    /*+
     JOIN_FIXED_ORDER()
     */
    t0.*
FROM
    t0 -- 件数多め（全部で100万レコードくらい）
    JOIN t3 -- 件数少なめ（全部で3レコードくらい）
    ON t0.t3_id = t3.t3_id
    JOIN t1 -- 件数やや多め（全部で1万レコードくらい）
    ON t0.t1_id = t1.t1_id
    JOIN t2 -- 件数やや多め（全部で10万レコードくらい）
    ON t0.t2_id = t2.t2_id
WHERE
    t0.created_at BETWEEN '1940-04-01'
    AND '2085-03-31'
ORDER BY
    t0.created_at
LIMIT
    30;

SELECT
    /*+
     JOIN_FIXED_ORDER()
     */
    t0.*
FROM
    t0 -- 件数多め（全部で100万レコードくらい）
    JOIN t2 -- 件数やや多め（全部で10万レコードくらい）
    ON t0.t2_id = t2.t2_id
    JOIN t1 -- 件数やや多め（全部で1万レコードくらい）
    ON t0.t1_id = t1.t1_id
    JOIN t3 -- 件数少なめ（全部で3レコードくらい）
    ON t0.t3_id = t3.t3_id
WHERE
    t0.created_at BETWEEN '1940-04-01'
    AND '2085-03-31'
ORDER BY
    t0.created_at
LIMIT
    30;

create index at_index on t0(created_at);

SELECT
    t0.*
FROM
    t0 -- 件数多め（全部で100万レコードくらい）
    JOIN t2 -- 件数やや多め（全部で10万レコードくらい）
    ON t0.t2_id = t2.t2_id
    JOIN t1 -- 件数やや多め（全部で1万レコードくらい）
    ON t0.t1_id = t1.t1_id
    JOIN t3 -- 件数少なめ（全部で3レコードくらい）
    ON t0.t3_id = t3.t3_id
WHERE
    t0.created_at BETWEEN '1940-04-01'
    AND '2085-03-31'
ORDER BY
    t0.created_at
LIMIT
    30;
