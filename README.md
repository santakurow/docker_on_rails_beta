# Rails-New-Template v1.0

[Docker](https://www.docker.com/products/docker-desktop) で構築された、[Ruby on Rails](https://github.com/rails/rails) 自作テンプレート  
無駄なセットアップ作業は必要なしで、以下の方法で立ち上げればすぐに docker 上で使用可能(docker が手元の PC にインストールされていることが前提)

このテンプレートは、Rails のプロジェクト作成からコンテナ起動までを含みます。

すでにプロジェクトが出来上がっている状態のテンプレートは[こちら](https://github.com/santakurow/rails-template)です。

- Ruby v2.7.3
- Rails v6.1

## 使い方

1. サイト右上の **Use this template** からこのリポジトリをテンプレートとして新しく複製し、その複製されたリポジトリを作業ディレクトリにクローンする

```
$ git clone https://github.com/santakurow/リポジトリ名.git
```

2. `.env.sample`からコピーした`.env`ファイル内の環境変数 **APP_NAME** にプロジェクト名を設定する
   （設定しない場合はデフォルト値の **app** でプロジェクト名が設定される）

- `.env` を以下のように編集する

```
APP_NAME=プロジェクト名  <== ここのプロジェクト名を好きな名前に変更

# MYSQL_USERNAME=
# MYSQL_PASSWORD=
# MYSQL_HOST=
```

3.  docker のセットアップを実行する（初回のみ）

```
$ ./setup.sh
```

4. コンテナを起動する

```
$ docker-compose up
```

### `Gemfile` を更新する場合

```
$ docker-compose run --rm web bundle install
```

### webpacker for css(sass)

css(sass)を webpacker で管理することもできる。  
しかし、少々設定が面倒なため、独自のアプリケーションテンプレートを使用して以下の方法で簡単に設定できる

```
$ rails app:template LOCATION=./optional.rb
```

Enjoy!
