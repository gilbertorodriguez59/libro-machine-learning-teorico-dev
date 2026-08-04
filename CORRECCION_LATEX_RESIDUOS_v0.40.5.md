# Corrección LaTeX de residuos — versión 0.40.5

El error se encontraba en la fórmula:

```latex
e_i = y_i - \hat{y}_i
```

La fórmula estaba delimitada mediante `\[ ... \]`, pero Pandoc la transformó de forma incorrecta.
Se sustituyó por un bloque matemático de Quarto:

```markdown
$$
e_i = y_i - \hat{y}_i.
$$
```
