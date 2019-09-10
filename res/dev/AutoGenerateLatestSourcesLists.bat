@rem - Encoding:utf-8; Mode:Batch; Language:en; LineEndings:CRLF -
:: Auto-Generate Sources Lists for "Video Downloaders One-Click Deployment Batch"
:: Author: Lussac (https://blog.lussac.net)
:: Last updated: 2019-09-04
:: >>> The extractor algorithm could be expired as the revision of websites. <<<
:: >>> Get updated from: https://github.com/LussacZheng/video-downloader-deploy/tree/master/res/dev <<<
:: >>> EDIT AT YOUR OWN RISK. <<<
@echo off
REM setlocal EnableDelayedExpansion


rem ================= Requirement Check =================


if NOT exist wget.exe (
    if exist ..\wget.exe ( 
        xcopy ..\wget.exe .\ > NUL
    ) else ( 
        echo "wget.exe" not founded. Please download it from
        echo https://raw.githubusercontent.com/LussacZheng/video-downloader-deploy/master/res/wget.exe
        pause>NUL
        exit
    ) 
)


:DownloadWebPages
echo If the download process is interrupted, close this window and re-run.
echo Downloading web pages...
echo Please be patient while waiting for the download...
echo. & echo.
echo py=python, yg=you-get, yd=youtube-dl, an=annie, ff=ffmpeg
echo.
wget -q --show-progress --progress=bar:force:noscroll --no-check-certificate -np https://www.python.org/downloads/windows/ -O pyLatestRelease.txt
wget -q --show-progress --progress=bar:force:noscroll --no-check-certificate -np https://pypi.org/project/you-get/#files -O ygLatestRelease.txt
wget -q --show-progress --progress=bar:force:noscroll --no-check-certificate -np https://github.com/ytdl-org/youtube-dl/releases/latest -O ydLatestRelease.txt
wget -q --show-progress --progress=bar:force:noscroll --no-check-certificate -np https://github.com/iawia002/annie/releases/latest -O anLatestRelease.txt
wget -q --show-progress --progress=bar:force:noscroll --no-check-certificate -np https://ffmpeg.zeranoe.com/builds/win64/static/ -O ffLatestRelease.txt
echo. & echo.


rem ================= Get Variables =================


:GetPythonLatestVersion
REM @param  %pyLatestVersion%,  %pyLatestReleasedTime%

:: The output of 'findstr /n /i /c:"Latest Python 3 Release" pyLatestRelease.txt' should be like: 
::     503:            <li><a href="/downloads/release/python-374/">Latest Python 3 Release - Python 3.7.4</a></li>
for /f "tokens=9 delims= " %%a in ('findstr /n /i /c:"Latest Python 3 Release" pyLatestRelease.txt') do ( set pyLatestVersion="%%a" )
:: %%a is like: 3.7.4</a></li>
:: Use ` set pyLatestVersion="%%a" ` instead of ` set "pyLatestVersion=%%a" `, since %%a contains '<' and '>'
:: And now %pyLatestVersion% is "3.7.4</a></li>" , containing "" , so next command should not be:
:: for /f "tokens=1 delims=<" %%b in ("%pyLatestVersion%"") do ( set "pyLatestVersion=%%b" )
for /f "tokens=1 delims=<" %%b in (%pyLatestVersion%) do ( set "pyLatestVersion=%%b" )
echo pyLatestVersion: %pyLatestVersion%

:: The output of 'findstr /n /i /c:"Python 3.7.4 -" pyLatestRelease.txt' should be like: 
::     514:                        <a href="/downloads/release/python-374/">Python 3.7.4 - July 8, 2019</a>
for /f "tokens=2 delims=>" %%c in ('findstr /n /i /c:"Python %pyLatestVersion% -" pyLatestRelease.txt') do ( set pyLatestReleasedTime="%%c" )
set "pyLatestReleasedTime=%pyLatestReleasedTime:<= %"
:: Now %pyLatestReleasedTime% is like: "Python 3.7.4 - July 8, 2019 /a"
:: Similarly, %pyLatestReleasedTime% contains "" , no additional ""
for /f "tokens=4-6 delims= " %%d in (%pyLatestReleasedTime%) do ( set "pyLatestReleasedTime_month=%%d" && set "pyLatestReleasedTime_day=%%e" && set "pyLatestReleasedTime_year=%%f" )
set "pyLatestReleasedTime=%pyLatestReleasedTime_year:"=%-%pyLatestReleasedTime_month%-%pyLatestReleasedTime_day:,=%"
echo pyLatestReleasedTime: %pyLatestReleasedTime%
echo.


:GetYougetLatestVersion
REM @param  %ygUrl%,  %ygLatestVersion%,  %ygLatestReleasedTime%,  %ygBLAKE2%
REM Get %ygUrl% from https://pypi.org/project/you-get/#files

:: The output of 'findstr /n /i "files.pythonhosted.org" ygLatestRelease.txt' should be like: 
::     4865:   <a href="https://files.pythonhosted.org/packages/20/35/4979bb3315952a9cb20f2585455bec7ba113db5647c5739dffbc542e8761/you_get-0.4.1328-py3-none-any.whl">
::     4886:   <a href="https://files.pythonhosted.org/packages/fd/a5/c896dccb53f44f54c5c8bcfbc7b8d953289064bcfbf17cccb68136fde3bf/you-get-0.4.1328.tar.gz">
for /f "skip=1 tokens=3 delims= " %%a in ('findstr /n /i "files.pythonhosted.org" ygLatestRelease.txt') do ( set ygUrl="%%a" )
REM for /f "tokens=* delims= " %%a in ('findstr /n /i "you-get-" ygLatestRelease.txt') do ( set ygUrl="%%a" )
:: Replace the " with ' since delims cannot be "
set ygUrl="%ygUrl:"='%"
:: Now %ygUrl% is like: "'href='https://files.pythonhosted.org/packages/fd/a5/c896dccb53f44f54c5c8bcfbc7b8d953289064bcfbf17cccb68136fde3bf/you-get-0.4.1328.tar.gz'>' "
:: Similarly, %ygUrl% contains "" , no additional ""
for /f "tokens=2 delims='" %%b in (%ygUrl%) do ( set "ygUrl=%%b" )
:: Now %ygUrl% is like: https://files.pythonhosted.org/packages/fd/a5/c896dccb53f44f54c5c8bcfbc7b8d953289064bcfbf17cccb68136fde3bf/you-get-0.4.1328.tar.gz

:: Get the version number form %ygUrl%
for /f "tokens=7 delims=/" %%c in ("%ygUrl%") do ( set "ygLatestVersion=%%c")
set ygLatestVersion=%ygLatestVersion:you-get-=%
set ygLatestVersion=%ygLatestVersion:.tar.gz=%
echo ygLatestVersion: %ygLatestVersion%

:: The output of 'findstr /n /i /c:"Last released" ygLatestRelease.txt' should be like: 
::     190:      <p class="package-header__date">Last released: <time class="-js-relative-time" datetime="2019-08-02T11:31:02+0000" data-controller="localized-time" data-localized-time-relative="true">
for /f "tokens=4 delims==" %%d in ('findstr /n /i /c:"Last released" ygLatestRelease.txt') do ( set "ygLatestReleasedTime=%%d" )
:: Now %ygLatestReleasedTime% is like: "2019-08-02T11:31:02+0000" data-controller
for /f "tokens=1-3 delims=-" %%u in ("%ygLatestReleasedTime%") do ( set "ygLatestReleasedTime_1=%%u" && set "ygLatestReleasedTime_2=%%v" && set "ygLatestReleasedTime_3=%%w" )
set "ygLatestReleasedTime=%ygLatestReleasedTime_1:"=%-%ygLatestReleasedTime_2%-%ygLatestReleasedTime_3:~0,2%"
echo ygLatestReleasedTime: %ygLatestReleasedTime%

:: Get the "Hash digest" in BLAKE2-256(Algorithm) for "you-get-v.er.sion.tar.gz" from %ygUrl%
for /f "tokens=4-6 delims=/" %%x in ("%ygUrl%") do ( set "ygUrl_BLAKE2_1=%%x" && set "ygUrl_BLAKE2_2=%%y" && set "ygUrl_BLAKE2_3=%%z" )
set "ygBLAKE2=%ygUrl_BLAKE2_1%/%ygUrl_BLAKE2_2%/%ygUrl_BLAKE2_3%"
echo ygBLAKE2-256: %ygBLAKE2%
echo.


:GetYoutubedlLatestVersion
REM @param  %ydLatestVersion%

:: The output of 'findstr /n /i "<title>" ydLatestRelease.txt' should be like: 
::     31:  <title>Release youtube-dl 2019.08.02 · ytdl-org/youtube-dl · GitHub</title>
for /f "tokens=4 delims= " %%a in ('findstr /n /i "<title>" ydLatestRelease.txt') do ( set "ydLatestVersion=%%a" )
echo ydLatestVersion: %ydLatestVersion%
echo.


:GetAnnieLatestVersion
REM @param  %anLatestVersion%,  %anLatestReleasedTime%

:: The output of 'findstr /n /i "<title>" anLatestRelease.txt' should be like: 
::     31:  <title>Release 0.9.4 · iawia002/annie · GitHub</title>
for /f "tokens=3 delims= " %%a in ('findstr /n /i "<title>" anLatestRelease.txt') do ( set "anLatestVersion=%%a" )
echo anLatestVersion: %anLatestVersion%

:: The output of 'findstr /n /i "relative-time" anLatestRelease.txt' should be like: 
::     700:    <relative-time datetime="2019-08-13T14:18:48Z">Aug 13, 2019</relative-time>
for /f "tokens=2 delims==" %%b in ('findstr /n /i "relative-time" anLatestRelease.txt') do ( set anLatestReleasedTime="%%b" )
:: Now %anLatestReleasedTime% is like: ""2019-08-13T14:18:48Z">Aug 13, 2019</relative-time>"
:: Similarly, %anLatestReleasedTime% contains "" , no additional ""
for /f "tokens=1-3 delims=-" %%x in (%anLatestReleasedTime%) do ( set "anLatestReleasedTime_1=%%x" && set "anLatestReleasedTime_2=%%y" && set "anLatestReleasedTime_3=%%z" )
set "anLatestReleasedTime=%anLatestReleasedTime_1:"=%-%anLatestReleasedTime_2%-%anLatestReleasedTime_3:~0,2%"
echo anLatestReleasedTime: %anLatestReleasedTime%
echo.


:GetFfmpegLatestVersion
REM @param  %ffLatestVersion%,  %ffLatestReleasedTime%

for /f "delims=:" %%a in ('findstr /n /i "latest" ffLatestRelease.txt') do ( set "lineNum=%%a" )
set /a lineNum-=2
for /f "skip=%lineNum% delims=" %%b in (ffLatestRelease.txt) do ( set ffInfo="%%b" && goto :next )
:: Now %ffInfo% is like: "<tr><td><a href="ffmpeg-4.1.4-win64-static.zip" title="ffmpeg-4.1.4-win64-static.zip">ffmpeg-4.1.4-win64-static.zip</a></td><td>61.9 MiB</td><td>2019-Jul-18 15:17</td></tr>"
:next
:: Similarly, %ffInfo% contains "" , no additional ""
for /f "tokens=2 delims=-" %%c in (%ffInfo%) do ( set "ffLatestVersion=%%c" )
echo ffLatestVersion: %ffLatestVersion%
for /f "tokens=4 delims= " %%d in (%ffInfo%) do ( set ffLatestReleasedTime="%%d" )
:: Now %ffLatestReleasedTime% is like: "MiB</td><td>2019-Jul-18"
:: Similarly, no additional ""
for /f "tokens=3 delims=>" %%e in (%ffLatestReleasedTime%) do ( set ffLatestReleasedTime=%%e )
echo ffLatestReleasedTime: %ffLatestReleasedTime%


:DeleteWebPages
del /Q pyLatestRelease.txt >NUL 2>NUL
del /Q ygLatestRelease.txt >NUL 2>NUL
del /Q ydLatestRelease.txt >NUL 2>NUL
del /Q anLatestRelease.txt >NUL 2>NUL
del /Q ffLatestRelease.txt >NUL 2>NUL
if exist .wget-hsts del .wget-hsts
echo. & echo.


rem ================= Generate Sources Lists =================


:AutoGenerateSourcesLists
set "filePath=sources.txt"
call :WriteCommon
call :WritePython
call :WriteYouget
call :WriteYoutubedl
call :WriteAnnie
call :WritePip
call :WriteFfmpeg
echo "%filePath%" has been generated.
echo Finished.
pause>NUL
exit


rem ================= FUNCTIONS =================


:GetDateTime
for /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') do ( set "LDT=%%a" )
set "formatedDateTime=%LDT:~0,4%-%LDT:~4,2%-%LDT:~6,2% %LDT:~8,2%:%LDT:~10,2%:%LDT:~12,2%"
goto :eof


:WriteCommon
call :GetDateTime
echo ## Sources List of "video-downloader-deploy"> %filePath%
echo ## https://github.com/LussacZheng/video-downloader-deploy/blob/master/res/sources.txt>> %filePath%
echo ## For Initial Deployment; Deployment of FFmpeg; Upgrade of You-Get.>> %filePath%
echo ## ( Auto-Generated by "%~nx0" at %formatedDateTime% )>> %filePath%
echo.>> %filePath%
:: use ^^! if EnableDelayedExpansion
echo ^<!-- DO NOT EDIT THIS FILE unless you understand the EXAMPLE. --^>>> %filePath%
echo.>> %filePath%
echo EXAMPLE>> %filePath%
echo ## Title or Info>> %filePath%
echo     # Content that already downloaded or existing.>> %filePath%
echo     Content to be downlaoded.>> %filePath%
echo     $ Another (optional) source of the same content above. But the script will ignore this line. Exchange the URLs at your own risk.>> %filePath%
echo Mirrors{>> %filePath%
echo     [origin]>> %filePath%
echo     URL of the content from original source. NO '@', called "switch on".>> %filePath%
echo     [%%region1%%]>> %filePath%
echo     @ URL of the content from mirror source in %%region1%%.>> %filePath%
echo     $ "@ URL", that content will not to be downlaoded by this URL, called "switch off".>> %filePath%
echo     [%%region2%%]>> %filePath%
echo     @ For a same content in { }, only one URL is switched on at one time.>> %filePath%
echo }>> %filePath%
echo.>> %filePath%
echo ^<skip^>>> %filePath%
echo.>> %filePath%
echo.>> %filePath%
echo [common]>> %filePath%
echo ## wget.exe , v1.20.3 , win32>> %filePath%
echo     # https://eternallybored.org/misc/wget/1.20.3/32/wget.exe>> %filePath%
echo     $ https://raw.githubusercontent.com/LussacZheng/video-downloader-deploy/master/res/wget.exe>> %filePath%
echo.>> %filePath%
echo ## 7za.exe , v19.00 , win32>> %filePath%
echo     # https://raw.githubusercontent.com/LussacZheng/video-downloader-deploy/master/res/7za.exe>> %filePath%
echo [/common]>> %filePath%
echo.>> %filePath%
echo.>> %filePath%
goto :eof


:WritePython
echo [portable][quickstart][withpip]>> %filePath%
echo ## Release log - Python>> %filePath%
echo ## https://www.python.org/downloads/   or   https://www.python.org/downloads/windows/>> %filePath%
echo ## Last released: %pyLatestReleasedTime%>> %filePath%
echo.>> %filePath%
echo ## python-embed.zip , v%pyLatestVersion% , win32>> %filePath%
echo Mirrors{>> %filePath%
echo     [origin]>> %filePath%
echo     https://www.python.org/ftp/python/%pyLatestVersion%/python-%pyLatestVersion%-embed-win32.zip>> %filePath%
echo     [cn]>> %filePath%
echo     @ https://npm.taobao.org/mirrors/python/%pyLatestVersion%/python-%pyLatestVersion%-embed-win32.zip>> %filePath%
echo     [test]>> %filePath%
echo     @ https://www.python.org/ftp/python/%pyLatestVersion%/python-%pyLatestVersion%-embed-win32.zip>> %filePath%
echo }>> %filePath%
echo [/portable][/quickstart][/withpip]>> %filePath%
echo.>> %filePath%
echo.>> %filePath%
goto :eof


:WriteYouget
:: %ygBLAKE2% is like: fd/a5/c896dccb53f44f54c5c8bcfbc7b8d953289064bcfbf17cccb68136fde3bf
echo [youget][portable][quickstart]>> %filePath%
echo ## Release log - YouGet>> %filePath%
echo ## https://pypi.org/project/you-get/#history   or   https://pypi.org/project/you-get/#files>> %filePath%
echo ## Last released: %ygLatestReleasedTime%>> %filePath%
echo.>> %filePath%
echo ## you-get.tar.gz , v%ygLatestVersion%>> %filePath%
echo Mirrors{>> %filePath%
echo     [origin]>> %filePath%
echo     https://files.pythonhosted.org/packages/%ygBLAKE2%/you-get-%ygLatestVersion%.tar.gz>> %filePath%
echo     $ https://github.com/soimort/you-get/releases/download/v%ygLatestVersion%/you-get-%ygLatestVersion%.tar.gz>> %filePath%
echo     [cn]>> %filePath%
echo     @ https://mirrors.tuna.tsinghua.edu.cn/pypi/web/packages/%ygBLAKE2%/you-get-%ygLatestVersion%.tar.gz>> %filePath%
echo     $ https://mirrors.aliyun.com/pypi/packages/%ygBLAKE2%/you-get-%ygLatestVersion%.tar.gz>> %filePath%
echo     [test]>> %filePath%
echo     @ http://mirrors.163.com/pypi/packages/%ygBLAKE2%/you-get-%ygLatestVersion%.tar.gz>> %filePath%
echo }>> %filePath%
echo [/youget][/portable][/quickstart]>> %filePath%
echo.>> %filePath%
echo.>> %filePath%
goto :eof


:WriteYoutubedl
echo [portable]>> %filePath%
echo ## Release log - YoutubeDL>> %filePath%
echo ## https://github.com/ytdl-org/youtube-dl/releases/latest>> %filePath%
echo ## Last released: %ydLatestVersion%>> %filePath%
echo.>> %filePath%
echo ## youtube-dl.tar.gz , %ydLatestVersion%>> %filePath%
echo     https://github.com/ytdl-org/youtube-dl/releases/download/%ydLatestVersion%/youtube-dl-%ydLatestVersion%.tar.gz>> %filePath%
echo [/portable]>> %filePath%
echo.>> %filePath%
echo.>> %filePath%
goto :eof


:WriteAnnie
echo [portable][withpip]>> %filePath%
echo ## Release log - Annie>> %filePath%
echo ## https://github.com/iawia002/annie/releases/latest>> %filePath%
echo ## Last released: %anLatestReleasedTime%>> %filePath%
echo.>> %filePath%
echo ## annie_Windows.zip , v%anLatestVersion%>> %filePath%
echo SystemType{>> %filePath%
echo     [64]>> %filePath%
echo     https://github.com/iawia002/annie/releases/download/%anLatestVersion%/annie_%anLatestVersion%_Windows_64-bit.zip>> %filePath%
echo     [32]>> %filePath%
echo     @ https://github.com/iawia002/annie/releases/download/%anLatestVersion%/annie_%anLatestVersion%_Windows_32-bit.zip>> %filePath%
echo }>> %filePath%
echo [/portable][/withpip]>> %filePath%
echo.>> %filePath%
echo.>> %filePath%
goto :eof


:WritePip
echo [withpip]>> %filePath%
echo ## get-pip.py>> %filePath%
echo     https://bootstrap.pypa.io/get-pip.py>> %filePath%
echo [/withpip]>> %filePath%
echo.>> %filePath%
echo.>> %filePath%
goto :eof


:WriteFfmpeg
echo [ffmpeg]>> %filePath%
echo ## Release log - FFmpeg>> %filePath%
echo ## https://ffmpeg.org/download.html#releases   or   https://ffmpeg.zeranoe.com/builds/win64/static/>> %filePath%
echo ## Last released: %ffLatestReleasedTime%>> %filePath%
echo.>> %filePath%
echo ## ffmpeg-static.zip , v%ffLatestVersion% , win64>> %filePath%
echo SystemType{>> %filePath%
echo     [64]>> %filePath%
echo     https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-%ffLatestVersion%-win64-static.zip>> %filePath%
echo     [32]>> %filePath%
echo     @ https://ffmpeg.zeranoe.com/builds/win32/static/ffmpeg-%ffLatestVersion%-win32-static.zip>> %filePath%
echo }>> %filePath%
echo [/ffmpeg]>> %filePath%
goto :eof


rem ================= End of File =================