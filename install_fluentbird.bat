@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

set "TB_DIR=%APPDATA%\Thunderbird"
set "PROFILES_DIR=%TB_DIR%\Profiles"
set "TARGET_PROFILE="

echo =====================================================
echo   Thunderbird FluentBird Setup (inkl. Custom CSS)
echo =====================================================
echo.

if not exist "%PROFILES_DIR%" (
    echo [!] Kein Thunderbird-Profil gefunden.
    echo     Bitte starte Thunderbird einmal kurz, schliesse es wieder
    echo     und fuehre dieses Skript danach erneut aus.
    echo.
    pause
    exit /b 1
)

rem 1. Aktives Profil aus installs.ini auslesen
if exist "%TB_DIR%\installs.ini" (
    for /f "usebackq tokens=1,* delims==" %%A in ("%TB_DIR%\installs.ini") do (
        if /i "%%A"=="Default" (
            set "REL_PATH=%%B"
            set "REL_PATH=!REL_PATH:/=\!"
            if exist "%TB_DIR%\!REL_PATH!" (
                set "TARGET_PROFILE=%TB_DIR%\!REL_PATH!"
            )
        )
    )
)

rem 2. Fallback: *.default-release Profil suchen
if not defined TARGET_PROFILE (
    for /d %%D in ("%PROFILES_DIR%\*.default-release") do (
        set "TARGET_PROFILE=%%D"
    )
)

rem 3. Fallback: erstes beliebiges Profil
if not defined TARGET_PROFILE (
    for /d %%D in ("%PROFILES_DIR%\*") do (
        if not defined TARGET_PROFILE set "TARGET_PROFILE=%%D"
    )
)

if not defined TARGET_PROFILE (
    echo [!] Konnte keinen Profilordner in "%PROFILES_DIR%" finden.
    echo.
    pause
    exit /b 1
)

echo Gefundenes Profil:
echo   %TARGET_PROFILE%
echo.

echo Kopiere chrome-Ordner (userChrome.css, custom.css, Icons)...
xcopy "%~dp0chrome" "%TARGET_PROFILE%\chrome\" /E /I /Y /Q >nul
if errorlevel 1 (
    echo [!] Fehler beim Kopieren des chrome-Ordners.
    pause
    exit /b 1
)

echo Kopiere user.js (userChrome, Mica-Transparenz, Startseite aus)...
copy /Y "%~dp0user.js" "%TARGET_PROFILE%\user.js" >nul
if errorlevel 1 (
    echo [!] Fehler beim Kopieren der user.js.
    pause
    exit /b 1
)

echo.
echo [OK] FluentBird wurde erfolgreich installiert!
echo      Falls Thunderbird gerade laeuft, bitte einmal komplett neu starten.
echo      (Hinweis: In Thunderbird muss das "System Theme" aktiv sein.)
echo.
pause
