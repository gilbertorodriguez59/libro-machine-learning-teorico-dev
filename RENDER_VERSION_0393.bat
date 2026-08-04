@echo off
chcp 65001 > nul
title Render libro teorico v0.39.3
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

quarto render --no-cache
if errorlevel 1 (
  echo ERROR: Fallo el render.
  pause
  exit /b 1
)

if exist "docs\%PDF%" start "" "docs\%PDF%"
if exist "docs\index.html" start "" "docs\index.html"

echo.
echo Figura de regresion lineal simple agregada al libro.
echo Revise el capitulo de Regresion lineal simple en web y PDF.
echo.
pause
