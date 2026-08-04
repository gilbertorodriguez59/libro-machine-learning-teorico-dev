@echo off
chcp 65001 > nul
title Render libro teorico v0.40.8
color 0B

set "PROYECTO=C:\libro-machine-learning-teorico-dev"
set "PDF=fundamentos-matematicos-aprendizaje-automatico.pdf"

cd /d "%PROYECTO%"

if not exist "_quarto.yml" (
  echo ERROR: No se encontro _quarto.yml
  pause
  exit /b 1
)

if exist ".quarto" rmdir /s /q ".quarto"
if exist "_freeze" rmdir /s /q "_freeze"
if exist "docs" rmdir /s /q "docs"
if exist "index.log" del /q "index.log"
if exist "index.aux" del /q "index.aux"
if exist "index.out" del /q "index.out"
if exist "index.toc" del /q "index.toc"
if exist "index.tex" del /q "index.tex"

quarto render --no-cache
if errorlevel 1 (
  echo.
  echo ERROR: Fallo el render.
  pause
  exit /b 1
)

if exist "docs\%PDF%" start "" "docs\%PDF%"
if exist "docs\index.html" start "" "docs\index.html"

echo.
echo Render completado.
echo Revise:
echo   - Figura de neurona artificial
echo   - Regresion lineal multiple en residuos
echo   - Ausencia de bloque duplicado al final del capitulo 10
echo.
pause
