@echo off
setlocal enabledelayedexpansion
set sum=0

for /L %%i in (0,1,100) do (
	set /a sum=!sum!+%%i
)

echo !sum!
