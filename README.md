# practice-ruby

## Railsプロジェクトのセットアップ手順
１．Railsがインストールされたイメージを作成する。
```bash
$ docker build -t practice-ruby:1.0.0 .
```

２．コンテナに接続する。
```bash
# イメージIDの取得。
$ docker images

# コンテナを起動&シェルで接続。
$ docker run --rm -v $PWD:/app -it [イメージID] bash
```

３．Railsプロジェクトを作成する。
```bash
$ rails new -B -d postgresql [プロジェクト名]
```
`rails new`のオプションについては以下を参照。  
https://railsdoc.com/rails