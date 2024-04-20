. .\functions.ps1

# 変数定義 #
## データベース接続情報
## データベースクエリ
## データエクスポートファイルパス
## aws接続情報
## S3バケットURI
## S3プレフィックス
## ログファイルパス
$logFile = "../log/log.txt"

# 処理開始ログ
Write-Host "Start"
Add-Content -Path $logFile -Value "Start"

# db からデータをエクスポート
try {
    ExportData
}
catch {
    Write-Host "Error: $_"
    Add-Content -Path $logFile -Value "Error: $_"
}

# s3 にアップロード
try {
    UploadFileS3 -BucketUri "s3://database-data/" -FilePath "./data/"
}
catch {
    Write-Host "Error: $_"
    Add-Content -Path $logFile -Value "Error: $_"
}

# 処理終了ログ
Write-Host "Finish"
Add-Content -Path $logFile -Value "Finish"
