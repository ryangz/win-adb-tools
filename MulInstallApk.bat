@ECHO OFF

ECHO [安装APK]

ECHO -------------------------------

ECHO [等待插入手机...]

adb wait-for-device

adb devices > devices.info

FOR /F "skip=1 tokens=1 " %%i in (devices.info) do (

ECHO [安装] %~nx1
adb -s %%i install -r %1

)

del /a/f/q devices.info

ECHO [暂停5秒自动关闭...]

ping -n 5 127.0.0.1>nul

@ECHO ON