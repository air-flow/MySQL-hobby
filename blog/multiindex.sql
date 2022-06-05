CREATE TABLE multi_index (
    col1 INT NOT NULL,
    col2 int NOT NULL,
    col3 int NOT NULL,
    -- PRIMARY KEY (col1),
    INDEX multicol_1 (col1, col2, col3)
);

INSERT INTO
    multi_index
SELECT
    CEIL(RAND() * 100000),
    CEIL(RAND() * 100000),
    CEIL(RAND() * 100000)
FROM
    mysql.time_zone_transition
    limit 10000;

SELECT
    CEIL(RAND() * 100000);

SELECT
    CEIL(RAND() * 100000);

CREATE TABLE `orders` (
    `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` bigint(8) UNSIGNED NOT NULL,
    `product_id` bigint(8) UNSIGNED NOT NULL,
    `count` int(10) UNSIGNED NOT NULL,
    `created_at` datetime NOT NULL,
    `canceled_at` datetime DEFAULT NULL,
    `delivered_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `ix_product_id_canceled_at_delivered_at` (`product_id`, `canceled_at`, `delivered_at`),
    KEY `index_orders_on_user_id` (`user_id`),
    CONSTRAINT `fk_orders_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
    CONSTRAINT `fk_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 200001 DEFAULT CHARSET = utf8;

SELECT
    table_schema,
    floor(SUM(data_length + index_length) / 1024 / 1024) AS ALL_MB,
    floor(SUM((data_length) / 1024 / 1024)) AS DATA_MB,
    floor(SUM((index_length) / 1024 / 1024)) AS INDEX_MB
FROM
    information_schema.tables
GROUP BY
    table_schema
ORDER BY
    sum(data_length + index_length) DESC;

SELECT
    table_name,
    ENGINE,
    table_schema,
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