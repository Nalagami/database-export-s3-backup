function ExportFile {
    param (
        [parameter(Mandatory = $true)] [string] $Parameter1, # 必須のパラメータ
        [string] $Parameter2 = "DefaultValue"               # デフォルト値を持つオプションのパラメータ
    )

    # 関数の本体
    Write-Output "Parameter1: $Parameter1"
    Write-Output "Parameter2: $Parameter2"
}

function UploadFileS3 {
    param (
        [parameter(Mandatory = $true)] [string] $BucketUri,
        [parameter(Mandatory = $true)] [string] $FilePath,
        [parameter(Mandatory = $true)] [string] $logFile
    )

    # s3 にファイルをアップロード
    try{
        aws s3 cp $FilePath $BucketUri --storage-class "DEEP_ARCHIVE" --recursive
    }
    catch {
        Write-Host "ファイルのアップロード中にエラーが発生しました: $_"
        Add-Content -Path $logFile -Value "ファイルのアップロード中にエラーが発生しました: $_"
        throw 1
    }
}
