CREATE TABLE auto_increment_test (id int PRIMARY KEY AUTO_INCREMENT);

INSERT INTO
    auto_increment_test
VALUES
    ();

CREATE TABLE LAST_INSERT_ID_test(id int PRIMARY KEY);

INSERT INTO
    LAST_INSERT_ID_test(id)
VALUES
    (0);

INSERT INTO
    LAST_INSERT_ID_test(id)
VALUES
    (LAST_INSERT_ID(id + 1));

SELECT
    *
FROM
    dual;