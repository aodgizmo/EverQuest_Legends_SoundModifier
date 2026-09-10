u/echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$f='%~dp0soundassets.txt'; $r=@('143^thunder1.wav^','144^thunder2.wav^','159^rainloop.wav^','4624^dog_atk.wav^','566^wolf_dire_atk.wav^','355^Wolf_Att.wav^','351^WereWAtt.wav^'); $c=Get-Content -LiteralPath $f; $c | Where-Object { $r -notcontains $_ } | Set-Content -LiteralPath $f -Encoding ASCII"
echo Done.
pause
