@echo off
chcp 65001 > nul
cd /d "%~dp0"

if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"

echo Generando web y PDF desde cero...
quarto render --no-cache

if errorlevel 1 (
  echo ERROR AL GENERAR.
  pause
  exit /b 1
)

echo.
echo Abra:
echo docs\fundamentos-matematicos-aprendizaje-automatico.pdf
echo.
echo La portada vertical debe aparecer como pagina 1.
pause
