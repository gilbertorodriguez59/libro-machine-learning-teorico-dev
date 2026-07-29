@echo off
chcp 65001 > nul
cd /d "%~dp0"

if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"

quarto render --no-cache
if errorlevel 1 (
  echo ERROR AL GENERAR EL LIBRO.
  pause
  exit /b 1
)

if not exist "docs\index.html" (
  echo ERROR: falta docs\index.html
  pause
  exit /b 1
)

if not exist "docs\fundamentos-matematicos-aprendizaje-automatico.pdf" (
  echo ERROR: falta el PDF.
  pause
  exit /b 1
)

git add .
git commit -m "Actualizacion v0.26 del libro teorico"
git push

echo.
echo Revise la web de desarrollo y la pagina 1 del PDF.
pause
