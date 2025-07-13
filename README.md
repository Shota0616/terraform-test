# Terraform学習用のプロジェクト

## 概要
このプロジェクトはTerraformを使ってAWS上にEC2インスタンスを作成します。

| ディレクトリ | 内容 |
| ---- | ---- |
| environments/dev/ | 開発環境用 |
| environments/staging/ | ステージング環境用 |
| environments/prod/| 本番環境 |
| modules/ | 再利用可能なモジュール群。例えば VPC や EC2、RDS などの共通構成を定義 |

## 使い方



```sh
terraform init
terraform plan
terraform apply
```

## 注意
- AWSの利用料金が発生します。不要になったら`terraform destroy`でリソースを削除してください。
- `terraform.tfstate`は機密情報を含むため、Gitなどにはアップロードしない


## tfstateファイルについて

terraformを使用して、インフラを構築するとtfstateファイルが生成されるが、インフラに変更を加える場合このファイルを見てリソースの追加や変更を判断される。
何も指定しないterraformを実行したディレクトリに保存されるが、これをローカルに保存してしまうとチーム開発をする際に状態が判断できなくなってしまうので、通常はS3などで管理する。


## Terraformのコマンド

公式ドキュメント

https://developer.hashicorp.com/terraform/docs

| コマンド                     | 説明                                                                 | よく使うオプション                |
|-----------------------------|----------------------------------------------------------------------|-----------------------------------|
| `terraform init`            | 初期化。プラグインのダウンロードや初期設定を行う                     | `-upgrade`（プラグインの更新）     |
| `terraform validate`        | Terraform ファイルの構文チェックを行う                                | -                                 |
| `terraform plan`            | 実行計画の確認。インフラにどんな変更が加わるかを出力する              | `-out=plan.tfplan`（後でapplyに使用） |
| `terraform apply`           | 実行計画を適用してインフラを変更する                                  | `-auto-approve`（確認なしで実行）   |
| `terraform destroy`         | 管理対象のインフラを削除する                                          | `-auto-approve`                    |
| `terraform fmt`             | Terraform ファイルを整形する                                          | `-recursive`（再帰的に整形）       |
| `terraform show`            | 現在のステートやプランファイルの内容を表示                            | `plan.tfplan`（ファイルを指定）     |
| `terraform output`          | 出力変数の値を表示                                                    | `-json`                            |
| `terraform providers`       | 使用中のプロバイダーの一覧を表示                                      | -                                 |
| `terraform state`           | ステートファイルを操作する（list、mv、rm などのサブコマンドあり）     | -                                 |
| `terraform import`          | 既存のリソースを Terraform 管理下に取り込む                           | -                                 |
| `terraform taint`           | リソースを破棄・再作成の対象にする（非推奨、`terraform apply -replace`推奨） | -                            |
| `terraform untaint`         | `taint` でマークしたリソースのマークを解除                             | -                                 |
| `terraform graph`           | リソースの依存関係をグラフ形式（DOT形式）で出力                       | -                                 |
| `terraform login`           | Terraform Cloud にログイン                                            | -                                 |
| `terraform logout`          | Terraform Cloud からログアウト                                        | -                                 |
| `terraform version`         | Terraform のバージョン情報を表示                                      | -                                 |
| `terraform -help`           | 全体やコマンドごとのヘルプを表示                                      | `terraform plan -help` など       |

