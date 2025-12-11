# ビルドステージ
FROM gcc:latest AS builder

# 作業ディレクトリを設定
WORKDIR /app

# ソースコードとビルドファイルをコピー
COPY include/ ./include/
COPY src/ ./src/
COPY makefile .

# プロジェクトをビルド（静的リンク）
RUN make clean && make CXXFLAGS="-g -static"

# 実行ステージ（軽量なイメージ）
FROM debian:bookworm-slim

# 作業ディレクトリを設定
WORKDIR /app

# ビルドステージから実行ファイルのみをコピー
COPY --from=builder /app/hello_world_d .

# 実行ファイルに実行権限を付与
RUN chmod +x hello_world_d

# コンテナ起動時のデフォルトコマンド
# 実行ファイルを実行後、無限待機
CMD ["sh", "-c", "./hello_world_d && tail -f /dev/null"]
