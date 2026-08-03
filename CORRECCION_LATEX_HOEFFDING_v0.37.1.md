# Corrección LaTeX — versión 0.37.1

El error:

`Missing $ inserted`

se originó en el ejemplo numérico de la desigualdad de Hoeffding. La expresión con
`\varepsilon`, `\sqrt` y `\frac` fue interpretada fuera del modo matemático.

Se reemplazó el bloque por sintaxis `$$ ... $$`, compatible con Quarto, Pandoc y LuaLaTeX.
