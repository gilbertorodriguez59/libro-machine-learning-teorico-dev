@echo off
chcp 65001 > nul
cd /d "%~dp0"

if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"

echo Generando HTML y PDF desde cero...
quarto render --no-cache

if errorlevel 1 (
  echo.
  echo ERROR: No se pudo generar el libro.
  pause
  exit /b 1
)

echo.
echo Revise en el PDF:
echo 1. Portada como pagina 1.
echo 2. Contenido inicial solo con capitulos.
echo 3. Recuadros de definiciones.
echo 4. Cajas de codigo R.
echo 5. Figuras de los capitulos 17 a 20.
echo 6. Indice tematico al final.
echo.
pause
