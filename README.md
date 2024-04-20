# terraform-s3-export

## 概要

データをエクスポートしてS3にアップロードするためのpowershellスクリプトの雛形

## 利用方法

```powershell
$env:AWS_ACCESS="アクセスキー"
$env:AWS_SECRET="シークレットキー"
$env:AWS_REGION="リージョン名"
```

初回のみ

```powershell
# tfstateファイルを保存するためのS3バケットを作成
aws s3api create-bucket --bucket "database-tfstate" --region $env:AWS_REGION
# データ保存用のS3バケットを作成
aws s3api create-bucket --bucket "database-data" --region $env:AWS_REGION 
```

データエクスポート

```powershell
cd terraform
terraform init
terraform plan
terraform apply
cd ../src
./main.ps1
```
