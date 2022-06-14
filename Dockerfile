# ベースイメージとして、Docker HubからPythonイメージを利用
FROM python:3.10

ENV PORT 8080
WORKDIR /app

# 依存ライブラリのインストール
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# アプリコードをイメージにコピー
COPY main.py /app/

# 実行コマンドを指定
CMD ["sh", "-c", "waitress-serve --host 0.0.0.0 --port $PORT main:app"]