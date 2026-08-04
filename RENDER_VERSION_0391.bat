@echo off
chcp 65001 > nul
title Render libro teorico v0.39.1
color 0B

set "PROYECTO=C:\libro-machine-learning-teorico-dev"
set "PDF=fundamentos-matematicos-aprendizaje-automatico.pdf"

echo ============================================================
echo   RENDER VERSION 0.39.1 - CORRECCIONES ESTRUCTURALES
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

echo [2/4] Renderizando...
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

echo [4/4] Abriendo el PDF...
start "" "docs\%PDF%"

echo.
echo COMPROBACIONES:
echo   1. La pagina fisica 1 debe ser la portada.
echo   2. No debe existir una hoja vacia antes de la portada.
echo   3. Las partes deben mostrar un solo numeral romano.
echo   4. Presentacion, Introduccion y Notacion no deben llevar numero.
echo   5. Conjuntos y funciones debe ser el capitulo 1.
echo   6. Series de tiempo debe ser el capitulo 22.
echo.
pause
