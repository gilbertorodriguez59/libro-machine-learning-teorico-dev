# Corrección de portada y bienvenida — versión 0.38.1

## Portada

La portada automática de Pandoc/Quarto se desactiva redefiniendo `\maketitle`.
La portada gráfica se inserta mediante `include-before-body`, inmediatamente después
de `\begin{document}`. Al no existir ya una portada automática previa, la imagen debe
ocupar la primera página efectiva del PDF.

## Bienvenida

La Bienvenida dejó de estar encerrada en un bloque exclusivo para HTML.
Ahora se renderiza en ambos formatos: web y PDF.
