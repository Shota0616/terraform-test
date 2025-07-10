# TerraformでEC2インスタンスを作成するプロジェクト

## 概要
このプロジェクトはTerraformを使ってAWS上にEC2インスタンスを作成します。

## 使い方
1. AWS CLIで認証情報を設定してください（`aws configure`）。
2. 必要に応じて`main.tf`のAMIやリージョン、インスタンスタイプを変更してください。
3. 以下のコマンドで初期化・適用します。

```sh
terraform init
terraform apply
```

## 注意
- AWSの利用料金が発生します。不要になったら`terraform destroy`でリソースを削除してください。
