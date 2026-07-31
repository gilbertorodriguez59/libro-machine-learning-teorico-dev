# Corrección del error LaTeX — versión 0.32.1

El error `You can't use \spacefactor in vertical mode` se originaba en una
redefinición del entorno `Shaded` que utilizaba comandos con `@` dentro de
`\AtBeginDocument`.

La versión corregida:

- elimina esa redefinición;
- conserva el entorno estándar de Quarto/Pandoc;
- mantiene el ajuste automático de líneas largas;
- conserva el resto de las mejoras editoriales.
