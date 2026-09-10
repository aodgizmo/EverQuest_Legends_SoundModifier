@echo off
goto :RUN


rem ============================================================
rem SOUNDS TO REMOVE
rem Copy complete lines directly from soundassets.txt.
rem Add or remove SOUND lines as needed.
rem ============================================================

:SOUND_LIST
143^thunder1.wav^
144^thunder2.wav^
159^rainloop.wav^
4624^dog_atk.wav^
566^wolf_dire_atk.wav^
355^Wolf_Att.wav^
351^WereWAtt.wav^
1927^goo_dam.wav^
:END_SOUND_LIST

rem ============================================================
rem DO NOT EDIT BELOW THIS LINE
rem ============================================================

:RUN
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$bat='%~f0'; $f='%~dp0soundassets.txt'; if (!(Test-Path -LiteralPath $f)) { Write-Host ''; Write-Host 'ERROR: soundassets.txt was not found.' -ForegroundColor Red; Write-Host 'Place this batch file inside your EQ Legends folder.'; exit 1 }; $lines=@(Get-Content -LiteralPath $bat); $start=[Array]::IndexOf($lines,':SOUND_LIST')+1; $end=[Array]::IndexOf($lines,':END_SOUND_LIST'); $rules=@($lines[$start..($end-1)] | Where-Object { $_.Length -gt 0 }); $content=@(Get-Content -LiteralPath $f); $removed=@($rules | Where-Object { $content -contains $_ }); $output=@($content | Where-Object { $rules -notcontains $_ }); Set-Content -LiteralPath $f -Value $output -Encoding ASCII; Write-Host ''; if ($removed.Count -gt 0) { Write-Host 'The following sounds have been removed:' -ForegroundColor Green; $removed | ForEach-Object { $name=$_ -replace '^[0-9]+\^','' -replace '\^$',''; Write-Host ('  X  ' + $name) }; Write-Host ''; Write-Host ($removed.Count.ToString() + ' sound(s) removed successfully.') -ForegroundColor Green } else { Write-Host 'No sounds were removed. They may already be disabled.' -ForegroundColor Yellow }"

echo.
echo Click any key to exit.
pause >nul
