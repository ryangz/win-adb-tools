@ECHO OFF

ECHO [��װAPK]

ECHO -------------------------------

ECHO [�ȴ������ֻ�...]

adb wait-for-device

adb devices > devices.info

FOR /F "skip=1 tokens=1 " %%i in (devices.info) do (

ECHO [��װ] %~nx1
adb -s %%i install -r %1

)

del /a/f/q devices.info

ECHO [��ͣ5���Զ��ر�...]

ping -n 5 127.0.0.1>nul

@ECHO ON