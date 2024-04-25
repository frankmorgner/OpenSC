If ($env:Platform -Match "x86") {
    Invoke-WebRequest -Uri "https://github.com/frankmorgner/vsmartcard/releases/download/virtualsmartcard-0.9/virtualsmartcard-0.9_win32.zip" -OutFile "virtualsmartcard.zip"
} Else {
    Invoke-WebRequest -Uri "https://github.com/frankmorgner/vsmartcard/releases/download/virtualsmartcard-0.9/virtualsmartcard-0.9_win64.zip" -OutFile "virtualsmartcard.zip"
}

7z x "virtualsmartcard.zip" -oC:\

CertMgr.exe /add C:\virtualsmartcard*\BixVReader.cer /s /r localMachine root /all
CertMgr.exe /add C:\virtualsmartcard*\BixVReader.cer /s /r localMachine trustedpublisher

Msiexec /i C:\virtualsmartcard*\BixVReaderInstaller.msi /qb! /l*v install.log
