SHOW TABLES;

CREATE TABLE auto(id int PRIMARY KEY AUTO_INCREMENT, s char(1));

INSERT INTO
    auto (s)
VALUES
    ("A");

INSERT INTO
    auto (s)
VALUES
    ("B");

INSERT INTO
    auto (s)
VALUES
    ("C");

SELECT
    *
FROM
    auto a;

COMMIT;

SHOW CREATE TABLE auto;

DELETE FROM
    auto
WHERE
    id = 3;

ALTER TABLE
    auto AUTO_INCREMENT = 1;