@echo off
TITLE ServerCraft Server Software
cd /d %~dp0

if exist bin\php\php.exe (
	set PHPRC=""
	set PHP_BINARY=bin\php\php.exe
) else (
	set PHP_BINARY=php
)

if exist ServerCraft.phar (
	set SERVERCRAFT_FILE=ServerCraft.phar
) else (
	echo ServerCraft.phar not found
	echo Downloads can be found at https://github.com/tobypayneyt/ServerCraft/releases
	pause
	exit 1
)

if exist bin\mintty.exe (
	start "" bin\mintty.exe -o Columns=88 -o Rows=32 -o AllowBlinking=0 -o FontQuality=3 -o Font="Consolas" -o FontHeight=10 -o CursorType=0 -o CursorBlinks=1 -h error -t "ServerCraft" -i bin/pocketmine.ico -w max %PHP_BINARY% %SERVERCRAFT_FILE% --enable-ansi %*
) else (
	REM pause on exitcode != 0 so the user can see what went wrong
	%PHP_BINARY% -c bin\php %SERVERCRAFT_FILE% %* || pause
)
echo Thanks for using ServerCraft!
echo Closing in 5...
timeout 5 >nul
