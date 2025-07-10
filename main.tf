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

// VPC（仮想プライベートクラウド）の作成。CIDRブロックを指定
// mainは他のリソースから参照可能な名前
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

// サブネットの作成。VPCに紐付け、CIDRブロックとアベイラビリティゾーンを指定
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
}

// セキュリティグループの作成。
resource "aws_security_group" "main" {
  name        = "example-sg"
  description = "Allow SSH"
  vpc_id      = aws_vpc.main.id

  // インバウンドルール: SSH(22番)を全てのIPから許可
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // アウトバウンドルール: 全ての通信を許可（-1は全てのプロトコル）
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// EC2インスタンスの作成。AMIやインスタンスタイプ、サブネット、セキュリティグループを指定
resource "aws_instance" "example" {
  ami                    = "ami-0c3fd0f5d33134a76" # Amazon Linux 2 の例。必要に応じて変更してください
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids  = [aws_security_group.main.id]
  key_name                = "isoda-key" # 事前に作成したキーペアの名前を指定

  tags = {
    Name = "example-instance"
  }
}