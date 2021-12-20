CREATE DATABASE advent2021;

USE advent2021;

DROP DATABASE advent;

SHOW DATABASES;

CREATE TABLE advents (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    address VARCHAR(128) NOT NULL,
    latlon POINT NOT NULL
);

DROP TABLE advents;

SELECT
    VERSION();

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "茶禅花",
        "三ツ星",
        "東京都 港区 南麻布 4-7-5",
        ST_GeomFromText('POINT(35.64980785547675 139.72841580761832)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "ヘレタ",
        "ハイセンス",
        "東京都 中央区 銀座 1-21-14",
        ST_GeomFromText('POINT(35.672680675384115 139.7706892178345)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "RhinoiR",
        "いくら",
        "東京都 港区 白金台 4-2-7",
        ST_GeomFromText('POINT(35.63955098605981 139.72810047607342)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "256 Chinese Restaurant",
        "肉",
        "東京都港区南青山7-10-10",
        ST_GeomFromText('POINT(35.659105441114136 139.7187464797685)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "エノキ飯店",
        "熱そう",
        "東京都 目黒区 三田 2-10-30",
        ST_GeomFromText('POINT(35.63924488847674 139.71247107704005)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "中国飯店 山麗川",
        "辛そう",
        "東京都 港区 東麻布 3-7-5",
        ST_GeomFromText('POINT(35.656449510639035 139.73851674670985)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "グンゲ",
        "フカヒレ",
        "東京都 中央区 銀座 7-4-5",
        ST_GeomFromText('POINT(35.670336627726805 139.76115233409124)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "相厨房 無",
        "アワビ",
        "	東京都 港区 白金 6-5-5",
        ST_GeomFromText('POINT(35.6445676673225 139.72518049284164)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "翡翠",
        "すごそう",
        "東京都 港区 六本木 4-4-2",
        ST_GeomFromText('POINT(35.66527837632412 139.7323430295452)')
    );

INSERT INTO
    advents (name, description, address, latlon)
VALUES
    (
        "猫峰",
        "上から",
        "東京都 港区 六本木 3-8-7",
        ST_GeomFromText('POINT(35.66344164600342 139.73458798966266)')
    );

SELECT
    *
FROM
    advents a;

SET
    @json = '{
  "type": "Polygon",
  "coordinates": [
    [
      [ 139.70856889128842,35.66437406359891]
      [ 139.76220227537425,35.66633039323733],
      [ 139.73594533214896,35.623490121041364],
      [ 139.71939832682938,35.67824257816885],
    ]
  ],
  "crs": {
    "type":"name",
      "properties": {
        "name":"EPSG:4326"
      }
  }
}';