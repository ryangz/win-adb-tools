@ECHO OFF

SETLOCAL enabledelayedexpansion

REM 获取日期,格式为：20140808

SET c_date=%date:~0,4%%date:~5,2%%date:~8,2%

REM 获取得小时,格式为：24小时制，10点前补0

SET c_time=%time:~0,2%

    IF /i %c_time% LSS 10 (

SET c_time=0%time:~1,1%

)

REM 组合小时、分、秒，格式为: 131420

SET c_time=%c_time%%time:~3,2%%time:~6,2%

REM 将当运行时间点做为日志文件名

SET logfilename=%c_date%%c_time%

REM 设置日志导出目录

SET logdir="d:\temp\log"

IF NOT EXIST %logdir% (

    ECHO.[ Exec ] 创建目录：%logdir%

    md %logdir%

)

ECHO.[ Exec ] 使用Logcat导出日志

adb logcat -d >%logdir%\%logfilename%_logcat.log

ECHO.[ Exec ] 导出traces文件

adb shell cat /data/anr/traces.txt>>%logdir%\%logfilename%_traces.log

:EXIT

ECHO.

ECHO.[ INFO ] 请按任意键关闭窗口...
PAUSE>nul
