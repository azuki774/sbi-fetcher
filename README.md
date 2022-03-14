# sbi-fetcher

- SBI証券のポートフォリオの１つ目のテーブルから（「投資信託（金額/つみたてNISA預り）」など）、CSV形式で保存するスクリプト。

- Dockerコンテナ実行ごとにデータを取得し、自動的に終了する。

- docker-compose.yml 経由の実行と、k8sでの実行のどちらも可能。

## 実行方法

### docker-compose
- ghcr.io からイメージ(https://github.com/azuki774/selenium-chrome) をベースにして実行
- 設定ファイル
    - `build/secret.env`
        ``` bash
        sbi_user=<SBIのユーザID>
        sbi_pass=<SBIのユーザID>
        ```
    を作成しておく。

- `make run` で実行する。
- ホストの `/data/sbi-port` に `yyyy-mm-dd.csv` が出力される。

### k8s
- ghcr.io からイメージ(https://github.com/azuki774/selenium-chrome/pkgs/container/selenium-chrome) を落として実行
- 設定ファイル
    - `kubectl create secret generic sbi-user-info --from-literal=sbi_user=<user_id> --from-literal=sbi_pass=<password>` で secret リソース `sbi-user-info` を作成する。


- `kubectl apply -f manifest` で実行する。
- ホストの `/data/sbi-port` に `yyyy-mm-dd.csv` が出力される。
