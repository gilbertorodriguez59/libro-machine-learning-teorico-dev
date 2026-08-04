@echo off
chcp 65001 > nul
title Render libro teorico v0.38
color 0B

set "PROYECTO=C:\libro-machine-learning-teorico-dev"
set "PDF=fundamentos-matematicos-aprendizaje-automatico.pdf"

echo ============================================================
echo   RENDER COMPLETO DEL LIBRO TEORICO - VERSION 0.38
echo ============================================================
echo.

if not exist "%PROYECTO%\_quarto.yml" (
    echo ERROR: No se encontro _quarto.yml en:
    echo %PROYECTO%
    echo.
    echo Verifique que haya copiado la version 0.38 en esa carpeta.
    pause
    exit /b 1
)

cd /d "%PROYECTO%"

echo [1/5] Verificando Quarto...
quarto --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Quarto no esta instalado o no esta disponible en CMD.
    pause
    exit /b 1
)

echo [2/5] Limpiando archivos generados anteriormente...
if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"

echo [3/5] Generando libro web y PDF...
echo.
quarto render --no-cache
if errorlevel 1 (
    echo.
    echo ============================================================
    echo   ERROR: EL RENDER NO TERMINO CORRECTAMENTE
    echo ============================================================
    echo.
    echo Revise el mensaje de error mostrado arriba.
    echo Tambien puede consultar:
    echo %PROYECTO%\index.log
    echo.
    pause
    exit /b 1
)

echo.
echo [4/5] Verificando archivos generados...

if not exist "docs\index.html" (
    echo ERROR: No se genero:
    echo docs\index.html
    pause
    exit /b 1
)

if not exist "docs\%PDF%" (
    echo ERROR: No se genero:
    echo docs\%PDF%
    pause
    exit /b 1
)

echo.
echo Archivos encontrados correctamente:
echo   docs\index.html
echo   docs\%PDF%
echo.

echo [5/5] Abriendo resultados...
start "" "docs\index.html"
start "" "docs\%PDF%"
start "" "docs"

echo.
echo ============================================================
echo   RENDER COMPLETADO CORRECTAMENTE
echo ============================================================
echo.
echo Revise especialmente:
echo   - portada como primera pagina del PDF
echo   - creditos editoriales
echo   - prefacio y agradecimientos
echo   - capitulos 21 y 22
echo   - glosario
echo   - indice tematico
echo   - acerca del autor
echo   - formulas, figuras y seudocodigos
echo.
pause
