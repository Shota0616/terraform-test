// Terraformのバージョンやプロバイダーの要件を定義
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

// AWSプロバイダーの設定。利用するリージョンを指定
provider "aws" {
  region = "ap-northeast-1" # 東京リージョン。必要に応じて変更してください
}

