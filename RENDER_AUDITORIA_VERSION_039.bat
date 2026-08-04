@echo off
chcp 65001 > nul
title Render y auditoria visual - Version 0.39
color 0B

set "PROYECTO=C:\libro-machine-learning-teorico-dev"
set "PDF=fundamentos-matematicos-aprendizaje-automatico.pdf"

echo ============================================================
echo   VERSION 0.39 - RENDER PARA AUDITORIA VISUAL
echo ============================================================
echo.

if not exist "%PROYECTO%\_quarto.yml" (
    echo ERROR: No se encontro _quarto.yml en:
    echo %PROYECTO%
    pause
    exit /b 1
)

cd /d "%PROYECTO%"

echo [1/4] Limpiando resultados anteriores...
if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"

echo [2/4] Renderizando...
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

echo [4/4] Abriendo resultados...
start "" "docs\%PDF%"
start "" "docs\index.html"
start "" "AUDITORIA_FINAL_VERSION_1_0.md"
start "" "AUDITORIA_INTEGRAL_v0.39.md"

echo.
echo Revise el PDF completo y la web.
echo Cuando termine, suba el PDF generado para la auditoria visual final.
echo.
pause
