@echo off
chcp 65001 > nul
title Render libro teorico v0.39.2
color 0B

set "PROYECTO=C:\libro-machine-learning-teorico-dev"
set "PDF=fundamentos-matematicos-aprendizaje-automatico.pdf"

echo ============================================================
echo   RENDER VERSION 0.39.2 - CORRECCION VISUAL CRITICA
echo ============================================================
echo.

if not exist "%PROYECTO%\_quarto.yml" (
    echo ERROR: No se encontro _quarto.yml en:
    echo %PROYECTO%
    pause
    exit /b 1
)

cd /d "%PROYECTO%"

echo [1/4] Limpiando por completo...
if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"
if exist "index.tex" del /q "index.tex"
if exist "index.log" del /q "index.log"
if exist "index.aux" del /q "index.aux"
if exist "index.toc" del /q "index.toc"

echo [2/4] Renderizando sin cache...
quarto render --no-cache
if errorlevel 1 (
    echo.
    echo ERROR: El render no termino correctamente.
    pause
    exit /b 1
)

echo [3/4] Verificando salidas...
if not exist "docs\index.html" (
    echo ERROR: No se genero docs\index.html
    pause
    exit /b 1
)
if not exist "docs\%PDF%" (
    echo ERROR: No se genero docs\%PDF%
    pause
    exit /b 1
)

echo [4/4] Abriendo el PDF...
start "" "docs\%PDF%"

echo.
echo REVISE:
echo   1. La pagina fisica 1 debe ser la portada.
echo   2. No debe existir ninguna hoja anterior a la portada.
echo   3. No debe existir una pagina casi vacia despues de Presentacion.
echo   4. Introduccion debe seguir inmediatamente a Presentacion.
echo.
pause
