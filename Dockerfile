# syntax=docker/dockerfile:1
# ベースイメージの設定
FROM ruby:3.0.2

# OSのコマンドを実行する際に使用するコマンド
# apt-get update パッケージリストの更新 -qq エラー以外は表示
# apt-get install -y パッケージのインストール 問い合わせがあった場合はすべて「y」と答える
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

#
WORKDIR /myapp

# イメージにホスト上のファイルやディレクトリをコピーする
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# OSのコマンドを実行する際に使用するコマンド
RUN bundle install

# Add a script to be executed every time the container starts.
# イメージにホスト上のファイルやディレクトリをコピーする
COPY entrypoint.sh /usr/bin/

# OSのコマンドを実行する際に使用するコマンド
RUN chmod +x /usr/bin/entrypoint.sh

#
ENTRYPOINT ["entrypoint.sh"]

#
EXPOSE 3000

# Configure the main process to run when running the image

# コンテナ起動時に実行するコマンド
CMD ["rails", "server", "-b", "0.0.0.0"]
#CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]