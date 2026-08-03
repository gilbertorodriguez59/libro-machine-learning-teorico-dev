@echo off
chcp 65001 > nul
title Publicar libro teórico - DESARROLLO
color 0B

set "DEV=C:\libro-machine-learning-teorico-dev"
set "PDF=fundamentos-matematicos-aprendizaje-automatico.pdf"

echo ============================================================
echo   PUBLICACION DE LA VERSION DE DESARROLLO
echo ============================================================
echo.

if not exist "%DEV%\_quarto.yml" (
    echo ERROR: No se encontro _quarto.yml en:
    echo %DEV%
    echo.
    pause
    exit /b 1
)

cd /d "%DEV%"

echo [1/6] Verificando Git...
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo ERROR: La carpeta no contiene un repositorio Git.
    pause
    exit /b 1
)

echo.
echo Repositorio remoto:
git remote -v
echo.
echo Rama actual:
git branch --show-current
echo.

echo [2/6] Limpiando archivos generados anteriormente...
if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"

echo [3/6] Generando libro web y PDF...
quarto render --no-cache
if errorlevel 1 (
    echo.
    echo ERROR: Quarto no pudo generar el libro.
    echo Revise el mensaje mostrado arriba.
    pause
    exit /b 1
)

echo [4/6] Verificando archivos generados...
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

echo.
echo Archivos encontrados correctamente:
echo   docs\index.html
echo   docs\%PDF%
echo.

echo [5/6] Preparando cambios para GitHub...
git add .

git diff --cached --quiet
if not errorlevel 1 (
    echo No hay cambios nuevos para subir.
) else (
    git commit -m "Version 0.37 revision final capitulos 21 y 22"
    if errorlevel 1 (
        echo ERROR: No se pudo crear el commit.
        pause
        exit /b 1
    )
)

echo [6/6] Subiendo a GitHub...
git push origin main
if errorlevel 1 (
    echo.
    echo ERROR: No se pudo subir la version de desarrollo.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo   DESARROLLO PUBLICADO CORRECTAMENTE
echo ============================================================
echo.
echo Web:
echo https://gilbertorodriguez59.github.io/libro-machine-learning-teorico-dev/
echo.
echo PDF:
echo https://gilbertorodriguez59.github.io/libro-machine-learning-teorico-dev/%PDF%
echo.
pause
