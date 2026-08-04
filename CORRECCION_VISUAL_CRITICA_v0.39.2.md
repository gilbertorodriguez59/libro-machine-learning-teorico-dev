# Corrección visual crítica — versión 0.39.2

## Problemas confirmados en el PDF 0.39.1

1. La página física 1 estaba vacía y la portada aparecía en la página 2.
2. La página 12 contenía únicamente una línea aislada de la Presentación.

## Correcciones

- Se eliminó el entorno LaTeX `titlepage`, responsable de expulsar una página vacía al inicio.
- La portada ahora se dibuja directamente dentro de `\\maketitle` y después se ejecuta un único `\\clearpage`.
- Se retiró la frase final que generaba una página huérfana en la Presentación.
- La Introducción debe comenzar inmediatamente después de la Presentación, sin una página casi vacía entre ambas.
