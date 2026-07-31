# Recuadros destacados en HTML y PDF

## Configuración aplicada

Se estableció globalmente:

```yaml
callout-appearance: default
callout-icon: true
```

También se añadieron explícitamente `appearance="default"` e `icon="true"`
a los recuadros existentes.

## PDF

Se agregó:

`estilos/callouts-pdf.tex`

Este archivo carga y configura `tcolorbox` para que los recuadros del PDF:

- tengan borde visible;
- admitan saltos de página;
- tengan esquinas suaves;
- mantengan separación respecto del texto;
- destaquen el encabezado en negritas.

## Resultado de la actualización

- Archivos Quarto modificados: 16
- Recuadros actualizados: 50
