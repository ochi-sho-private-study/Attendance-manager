# 勤怠管理くん

## このアプリについて

コンビニ店舗向けの勤怠管理アプリです。
想定ユーザーは全従業員です。

## ER 図

- ここに ER 図を添付する。

## 環境構築

### バックエンド

```
$ docker-compose build
$ docker network create latimeria-network
$ docker-compose run --rm att_backend rake db:create
$ docker-compose run --rm att_backend rake db:create RAILS_ENV=test
---------以下は未対応・未実装部分のため、実行できないが記述----------
$ docker-compose run --rm att_backend rake ridgepole:apply
$ docker-compose run --rm att_backend rake db:seed
```

### フロントエンド

```
$ docker-compose build
```
