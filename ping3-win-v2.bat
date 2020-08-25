for /f "tokens=12 delims=: " %%a in ('ipconfig ^| find "Default"') do set gateway=%%a
REM start cmd /k "echo %gateway%"
for /f "tokens=3 delims= " %%b in ('netsh WLAN show interfaces ^| find /i "SSID" ^| find /i /v "BSSID"') do set SSID=%%b
REM start cmd /k "echo %SSID%" 

if %SSID%==WeWorkCorp (
    set dns=8.8.8.8
    set domain=www.google.com
) else (
    set dns=223.5.5.5
    set domain=www.baidu.com
)

start cmd /k "ping -n 5000 %gateway%" 
start cmd /k "ping -n 5000 %dns%" 
start cmd /k "ping -n 5000 %domain%"
