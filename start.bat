@echo off
title portal.run
cd /d "%~dp0"
set PORT=8765
set PY=
where python >nul 2>nul && set PY=python
if not defined PY where py >nul 2>nul && set PY=py
if not defined PY (
  echo Python not found - opening index.html directly in your browser instead.
  start "" "%~dp0index.html"
  exit /b
)
echo.
echo   portal.run is live at http://localhost:%PORT%
echo   keep this window open while you play. close it to stop.
echo.
start "" /b cmd /c "ping -n 3 127.0.0.1 >nul && start http://localhost:%PORT%/"
%PY% -m http.server %PORT% --bind 127.0.0.1
