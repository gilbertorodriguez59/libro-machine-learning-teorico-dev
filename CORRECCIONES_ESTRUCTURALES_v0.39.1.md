# Correcciones estructurales del PDF — versión 0.39.1

## Hallazgos

1. La primera página física del PDF estaba vacía.
2. La portada aparecía en la segunda página.
3. Los números romanos de las partes aparecían duplicados en el contenido.
4. Presentación, Introducción y Notación general consumían los números de capítulo 1, 2 y 3.
5. Los 22 capítulos académicos terminaban numerados hasta el capítulo 25.

## Correcciones

- La portada gráfica redefine directamente `\maketitle`.
- Se eliminó `include-before-body` para la portada.
- Los nombres de las partes ya no contienen números romanos manuales.
- Las tres páginas preliminares se declararon con `{.unnumbered}`.
- “Lenguaje matemático, conjuntos y funciones” será el capítulo 1.
- “Series de tiempo y aprendizaje automático” será el capítulo 22.
