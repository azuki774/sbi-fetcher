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

### 出力CSVイメージ
    取引,ファンド名,買付日,数量,取得単価,現在値,前日比,前日比（％）,損益,損益（％）,評価額,編集
    積立  売却,AAA,--/--/--,26231,13000,11403,-258,-2.21,-4189.09,-12.28,29911.2,詳細 

    積立  売却,BBB,--/--/--,10946,31610,29726,+235,+0.80,-2062.22,-5.96,32538.07,詳細 

    積立  売却,CCC,--/--/--,32241,10887,10697,-14,-0.13,-612.57,-1.75,34488.19,詳細 

    積立  売却,DDD,--/--/--,22846,14927,14436,-17,-0.12,-1121.73,-3.29,32980.48,詳細 

    積立  売却,EEE,--/--/--,6873,49033,43090,-7,-0.02,-4084.62,-12.12,29615.75,詳細 
