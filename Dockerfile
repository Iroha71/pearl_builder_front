FROM node:12.18.3-alpine
# 環境変数設定(言語、タイムゾーン)
ENV LANG=C.UTF-8 TZ=Asia/Tokyo
# /appディレクトリに移動 (=cd /app)
WORKDIR /app
# apkのアップデート
RUN apk update
# ローカルで作成されているpackage.json, package-lock.json, yarn.lockをコンテナに反映
COPY ./package*.json ./
COPY ./yarn.lock ./
RUN yarn install
# ローカルのプロジェクトをコンテナに反映
COPY ./ .
# ローカルからアクセスできるように指定
ENV HOST 0.0.0.0

EXPOSE 3000