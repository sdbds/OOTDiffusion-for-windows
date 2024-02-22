Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1
#$Env:PIP_INDEX_URL = "https://mirror.baidu.com/pypi/simple"
#$Env:HF_ENDPOINT = "https://hf-mirror.com"

if (!(Test-Path -Path "venv")) {
    Write-Output  "����python���⻷��venv..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "��װ����..."
pip install -U -r requirements-windows.txt

huggingface-cli download --resume-download levihsu/OOTDiffusion --local-dir checkpoints

huggingface-cli download --resume-download openai/clip-vit-large-patch14 --local-dir checkpoints

Write-Output "��װ���"
Read-Host | Out-Null ;
