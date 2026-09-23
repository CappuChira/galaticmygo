@echo off
setlocal EnableExtensions
chcp 65001 >nul

where ffmpeg >nul 2>nul
if errorlevel 1 (
    echo [ERROR] ffmpeg was not found in PATH.
    echo Install ffmpeg or add its bin directory to PATH, then run this script again.
    pause
    exit /b 1
)

pushd "%~dp0"
set "MYGO_CONVERT_FAILED=0"

for %%E in (mp3 wav flac m4a aac) do (
    for %%F in (*.%%E) do (
        if exist "%%~fF" (
            echo [CONVERT] %%~nxF
            ffmpeg -hide_banner -loglevel warning -stats -n -i "%%~fF" -vn -c:a libvorbis -q:a 6 -ar 48000 "%%~dpnF.ogg"
            if errorlevel 1 (
                if exist "%%~dpnF.ogg" (
                    echo [SKIP] %%~nF.ogg already exists.
                ) else (
                    echo [FAILED] %%~nxF
                    set "MYGO_CONVERT_FAILED=1"
                )
            )
        )
    )
)

popd

if "%MYGO_CONVERT_FAILED%"=="1" (
    echo One or more files failed to convert.
    pause
    exit /b 1
)

echo All music files are ready. Existing OGG files were left unchanged.
pause
exit /b 0
