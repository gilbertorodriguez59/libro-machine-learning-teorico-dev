@echo off
chcp 65001 > nul
title Limpiar y generar PDF del libro teorico
cd /d C:\libro-machine-learning-teorico-dev

echo ================================================
echo 1. Eliminando archivos temporales de Quarto...
echo ================================================
if exist .quarto rmdir /s /q .quarto
if exist _freeze rmdir /s /q _freeze
if exist index.tex del /q index.tex
if exist index.log del /q index.log
if exist index.aux del /q index.aux
if exist index.out del /q index.out
if exist index.toc del /q index.toc

echo.
echo ================================================
echo 2. Generando el PDF desde cero...
echo ================================================
quarto render --to pdf --no-cache
if errorlevel 1 goto ERROR

echo.
echo ================================================
echo PDF GENERADO CORRECTAMENTE
echo ================================================
pause
exit /b 0

:ERROR
echo.
echo ================================================
echo OCURRIO UN ERROR. Revise el mensaje anterior.
echo ================================================
pause
exit /b 1
