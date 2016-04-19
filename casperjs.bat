../node_modules/casperjs/bin/casperjs test ./phantomcss-testsuite.js








REM @ECHO OFF
REM set CASPER_PATH=%~dp0..\node_modules\casperjs
REM echo "%CASPER_PATH%"
REM set CASPER_BIN=%CASPER_PATH%\bin\
REM set PHANTOMJS=%~dp0..\node_modules\phantomjs\lib\phantom\bin\phantomjs.exe
REM set ARGV=%*
REM set IS_SLIMERJS="false"

REM for %%a in (%*) do (
    REM if %%a equ slimerjs (
        REM set IS_SLIMERJS="true"
    REM )
REM )

REM if %IS_SLIMERJS% equ "false" (
    REM call "%PHANTOMJS%" "%CASPER_BIN%bootstrap.js" --casper-path="%CASPER_PATH%" --cli %ARGV%
REM ) else (
	REM call slimerjs "%CASPER_BIN%bootstrap.js" --casper-path="%CASPER_PATH%" --cli %ARGV%
REM )
