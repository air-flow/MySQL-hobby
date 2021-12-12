CREATE TABLE city_x (
    `ID` int NOT NULL AUTO_INCREMENT,
    `Name` char(35) NOT NULL DEFAULT '',
    `CountryCode` char(3) NOT NULL DEFAULT '',
    `District` char(20) NOT NULL DEFAULT '',
    `Info` json DEFAULT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE hello_worlds (
    `ID` int NOT NULL AUTO_INCREMENT,
    `City_Name` char(35) NOT NULL DEFAULT '',
    `District` char(20) NOT NULL DEFAULT '',
    `Info` json DEFAULT NULL,
    `Country_Code` char(3) NOT NULL DEFAULT '',
    `Country_Name` char(52) NOT NULL DEFAULT '',
    `Capital` int DEFAULT NULL,
    `Code2` char(2) NOT NULL DEFAULT '',
    `Language` char(30) NOT NULL DEFAULT '',
    `IsOfficial` enum('T', 'F') NOT NULL DEFAULT 'F',
    `Percentage` decimal(4, 1) NOT NULL DEFAULT '0.0',
    `doc` json DEFAULT NULL,
    `_id` varbinary(32) GENERATED ALWAYS AS (
        json_unquote(json_extract(`doc`, _utf8mb4 '$._id'))
    ) STORED NOT NULL,
    `_json_schema` json GENERATED ALWAYS AS (_utf8mb4 '{"type":"object"}') VIRTUAL,
    PRIMARY KEY (`ID`)
);

INSERT INTO
    hello_worlds (id, city_name, countrycode, district, info)
VALUES
    () --------------------------------------------------------------------------------------------------------------------------+
    | city | CREATE TABLE `city` (
        `ID` int NOT NULL AUTO_INCREMENT,
        `Name` char(35) NOT NULL DEFAULT '',
        `CountryCode` char(3) NOT NULL DEFAULT '',
        `District` char(20) NOT NULL DEFAULT '',
        `Info` json DEFAULT NULL,
        PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 4080 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci | + -------+--------------------------------------------------------------------------------------------
    + ---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | country | CREATE TABLE `country` (
        `Code` char(3) NOT NULL DEFAULT '',
        `Name` char(52) NOT NULL DEFAULT '',
        `Capital` int DEFAULT NULL,
        `Code2` char(2) NOT NULL DEFAULT '',
        PRIMARY KEY (`Code`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci | + ---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    + -----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | countrylanguage | CREATE TABLE `countrylanguage` (
        `CountryCode` char(3) NOT NULL DEFAULT '',
        `Language` char(30) NOT NULL DEFAULT '',
        `IsOfficial` enum('T', 'F') NOT NULL DEFAULT 'F',
        `Percentage` decimal(4, 1) NOT NULL DEFAULT '0.0',
        PRIMARY KEY (`CountryCode`, `Language`),
        KEY `CountryCode` (`CountryCode`),
        CONSTRAINT `countrylanguage_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci | + -----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    CREATE TABLE `countryinfo` (
        `doc` json DEFAULT NULL,
        `_id` varbinary(32) GENERATED ALWAYS AS (
            json_unquote(json_extract(`doc`, _utf8mb4 '$._id'))
        ) STORED NOT NULL,
        `_json_schema` json GENERATED ALWAYS AS (_utf8mb4 '{"type":"object"}') VIRTUAL,
        PRIMARY KEY (`_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci | + -------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
    city.name,
    District,
    Info,
    city.CountryCode,
    c.name AS country_code,
    capital,
    code2,
    Language,
    IsOfficial,
    percentage,
    doc,
    _id,
    _json_schema
FROM
    city
    INNER JOIN country c ON city.CountryCode = c.Code
    INNER JOIN countrylanguage c2 ON city.CountryCode = c2.CountryCode
    INNER JOIN countryinfo c3 ON JSON_UNQUOTE(JSON_EXTRACT(c3.doc, '$.Code')) = city.CountryCode;

INSERT INTO
    hello_worlds (
        `ID`,
        `City_Name`,
        `District`,
        `Info`,
        `Country_Code`,
        `Country_Name`,
        `Capital`,
        `Code2`,
        `Language`,
        `IsOfficial`,
        `Percentage`,
        `doc`,
    )
SELECT
    city.name,
    District,
    Info,
    city.CountryCode,
    c.name AS country_code,
    capital,
    code2,
    Language,
    IsOfficial,
    percentage,
    doc
FROM
    city
    INNER JOIN country c ON city.CountryCode = c.Code
    INNER JOIN countrylanguage c2 ON city.CountryCode = c2.CountryCode
    INNER JOIN countryinfo c3 ON JSON_UNQUOTE(JSON_EXTRACT(c3.doc, '$.Code')) = city.CountryCode;

CREATE TABLE hello_worlds (
    `ID`,
    `City_Name`,
    `District`,
    `Info`,
    `Country_Code`,
    `Country_Name`,
    `Capital`,
    `Code2`,
    `Language`,
    `IsOfficial`,
    `Percentage`,
    `doc`,
    `_id`,
    `_json_schema`
);

SELECT
    *
FROM
    countryinfo c
WHERE
    doc -> "$.Code" = LOWER("ABW");

SELECT
    *
FROM
    country
WHERE
    code = "abw";

SELECT
    *
FROM
    countryinfo c;

SELECT
    id,
    city.name,
    District,
    Info,
    city.CountryCode,
    c.name AS country_code,
    capital,
    code2,
    Language,
    IsOfficial,
    percentage
FROM
    city
    INNER JOIN country c ON city.CountryCode = c.Code
    INNER JOIN countrylanguage c2 ON city.CountryCode = c2.CountryCode;

SELECT
    COUNT(*)
FROM
    city;

SELECT
    *
FROM
    city
    INNER JOIN country c ON city.CountryCode = c.Code
    INNER JOIN countrylanguage c2 ON city.CountryCode = c2.CountryCode;

SELECT
    COUNT(*)
FROM
    countrylanguage c2;

SELECT
    count(*)
FROM
    city
    INNER JOIN country c ON city.CountryCode = c.Code;

SELECT
    *
FROM
    city c
    JOIN countryinfo ON JSON_CONTAINS(
        c.CountryCode,
        countryinfo.doc -> '$.Code',
        '$.Code'
    );

SELECT
    *
FROM
    countryinfo c
    JOIN city c2 ON JSON_UNQUOTE(JSON_EXTRACT(c.doc, '$.Code')) = c2.CountryCode;

SELECT
    JSON_EXTRACT(c.doc, '$.Code')
FROM
    countryinfo c;

SELECT
    doc,
    _id,
    _json_schema
FROM
    city
    INNER JOIN country c ON city.CountryCode = c.Code
    INNER JOIN countrylanguage c2 ON city.CountryCode = c2.CountryCode
    INNER JOIN countryinfo c3 ON JSON_UNQUOTE(JSON_EXTRACT(c3.doc, '$.Code')) = city.CountryCode
WHERE
    city.name = "tokyo";

SHOW CREATE TABLE hello_worlds;

INSERT INTO
    hello_worlds (
        `City_Name`,
        `District`,
        `Info`,
        `Country_Code`,
        `Country_Name`,
        `Capital`,
        `Code2`,
        `Language`,
        `IsOfficial`,
        `Percentage`,
        `doc`
    )
SELECT
    city.name,
    District,
    Info,
    city.CountryCode,
    c.name AS country_code,
    capital,
    code2,
    Language,
    IsOfficial,
    percentage,
    doc
FROM
    city
    INNER JOIN country c ON city.CountryCode = c.Code
    INNER JOIN countrylanguage c2 ON city.CountryCode = c2.CountryCode
    INNER JOIN countryinfo c3 ON JSON_UNQUOTE(JSON_EXTRACT(c3.doc, '$.Code')) = city.CountryCode;

SELECT
    ci.doc -> '$.Code',
    ci.doc -> '$.demographics.Population',
    c.Capital
FROM
    world_x.country c
    INNER JOIN world_x.countryinfo ci ON c.Code = ci.doc ->> '$.Code'
WHERE
    c.Name = 'Japan';

SELECT
    doc ->> '$.Code',
    doc -> '$.demographics.Population',
    Capital
FROM
    hello_worlds hw
WHERE
    City_Name = 'Japan';

SELECT
    DISTINCT doc ->> '$.Code',
    doc -> '$.demographics.Population',
    Capital
FROM
    hello_worlds hw
WHERE
    Country_Name = 'Japan';

SELECT
    DISTINCT Info -> '$.Population'
FROM
    hello_worlds
WHERE
    Country_Code = 'JPN'
    AND City_Name = 'Tokyo';

SELECT
    CountryCode,
    count(*)
FROM
    city
GROUP BY
    CountryCode
ORDER BY
    count(*) DESC
LIMIT
    10;

SELECT
    Country_Code,
    COUNT(*)
FROM
    hello_worlds hw
GROUP BY
    Country_Code
ORDER BY
    COUNT(*) DESC
LIMIT
    10;

SELECT
    *
FROM
    city
WHERE
    CountryCode = "JPN"
    AND (
        name = "tokyo"
        OR District = "tokyou"
    );

INSERT INTO
    hello_worlds (
        `City_Name`,
        `District`,
        `Info`,
        `Country_Code`,
        `Country_Name`,
        `Capital`,
        `Code2`,
        `Language`,
        `IsOfficial`,
        `Percentage`,
        `doc`
    )
VALUES
    (
        "Tokyo",
        "minatoku",
        '{"Population":146143}',
        "JPN",
        "Japan",
        1532,
        "JP",
        "Japanese",
        "F",
        0.0,
        ' {"GNP": 3787042, "_id": "00005de917d8000000000000006d", "Code": "JPN", "Name": "Japan", "IndepYear": -660, "geography": {"Region": "Eastern Asia", "Continent": "Asia", "SurfaceArea": 377829}, "government": {"HeadOfState": "Akihito", "GovernmentForm": "Constitutional Monarchy"}, "demographics": {"Population": 146143, "LifeExpectancy": 80.69999694824219}}'
    )