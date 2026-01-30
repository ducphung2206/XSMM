@echo off
REM ============================================
REM XSMM Copilot - Excel Add-in Installer
REM Run as Administrator
REM ============================================

echo.
echo ========================================
echo   XSMM Copilot Excel Add-in Installer
echo ========================================
echo.

REM Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python not found! Please install Python 3.9+
    pause
    exit /b 1
)

echo [1/4] Installing Python dependencies...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo [2/4] Installing xlwings Excel add-in...
xlwings addin install
if %errorlevel% neq 0 (
    echo [WARNING] xlwings addin install failed
    echo Please run manually: xlwings addin install
)

echo.
echo [3/4] Creating Excel workbook with UDFs...
python -c "import xlwings as xw; wb = xw.Book(); wb.save('XSMM_Copilot.xlsm')"
if %errorlevel% neq 0 (
    echo [WARNING] Could not create workbook automatically
)

echo.
echo [4/4] Setting up configuration...
copy xlwings.conf "%USERPROFILE%\.xlwings\xlwings.conf" /Y >nul 2>&1

echo.
echo ========================================
echo   Installation Complete!
echo ========================================
echo.
echo Next steps:
echo 1. Open Excel
echo 2. Enable xlwings Add-in (File ^> Options ^> Add-ins)
echo 3. Open XSMM_Copilot.xlsm
echo 4. Use functions like =xsmm_search("bê tông")
echo.
echo Make sure the API is running:
echo   docker compose up -d
echo.
pause
