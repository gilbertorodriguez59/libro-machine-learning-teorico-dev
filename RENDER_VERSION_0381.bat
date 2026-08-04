@echo off
chcp 65001 > nul
title Render libro teorico v0.38.1
color 0B

set "PROYECTO=C:\libro-machine-learning-teorico-dev"
set "PDF=fundamentos-matematicos-aprendizaje-automatico.pdf"

echo ============================================================
echo   RENDER COMPLETO DEL LIBRO TEORICO - VERSION 0.38.1
echo ============================================================
echo.

if not exist "%PROYECTO%\_quarto.yml" (
    echo ERROR: No se encontro _quarto.yml en:
    echo %PROYECTO%
    pause
    exit /b 1
)

cd /d "%PROYECTO%"

echo [1/4] Limpiando archivos anteriores...
if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"

echo [2/4] Renderizando web y PDF...
quarto render --no-cache
if errorlevel 1 (
    echo.
    echo ERROR: El render no termino correctamente.
    pause
    exit /b 1
)

echo [3/4] Verificando resultados...
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

echo [4/4] Abriendo PDF y web...
start "" "docs\%PDF%"
start "" "docs\index.html"

echo.
echo Revise inmediatamente:
echo   1. La portada debe ser la primera pagina del PDF.
echo   2. La pagina Bienvenida debe contener texto y objetivos.
echo.
pause
