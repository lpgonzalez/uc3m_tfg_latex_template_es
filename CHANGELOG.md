# Registro de cambios

Todos los cambios destacables de esta plantilla se documentan en este fichero.

El formato se basa en [Keep a Changelog](https://keepachangelog.com/es/1.1.0/)
y la plantilla sigue [Versionado Semántico](https://semver.org/lang/es/).

## [2.0.0] - 2026-05-22

Revisión mayor de la plantilla: salida lista para el depósito (PDF/A),
tipografía y emojis modernos, capítulos y ejemplos ampliados, metadatos en el
PDF y documentación y comentarios bilingües.

### Añadido
- Salida **PDF/A-2b** para el depósito en e-Archivo mediante el interruptor
  `\pdfaOutput` en `tfg_main.tex` (`\DocumentMetadata`, *OutputIntent* sRGB y
  PDF 1.7). Validado con veraPDF.
- En modo PDF/A, los **hiperenlaces se colorean** (azul) para que sigan siendo
  distinguibles.
- **Emojis a color vectoriales** con OpenMoji vía `\emoji{...}`; se incrustan
  como glifos y son válidos en PDF/A.
- Entorno **`tfglandscape`** para páginas realmente apaisadas (A4 horizontal),
  con encabezado y pie del cuerpo, válido también en PDF/A.
- Interruptor **`\showDemoChapter`** para mostrar u ocultar el capítulo de
  demostración sin tener que comentar nada en `tfg_main.tex`.
- **Metadatos de la plantilla** en el PDF (campo Creator y propiedades
  personalizadas `Template.*`: URL, Author, Contributors, Version, Date,
  Comments), en el nuevo fichero `tfg_template_info.tex`.
- **Resaltado de código por lenguaje**: un único esquema de `listings` colorea
  Python, C, C++, Java, HTML, SQL, bash...; basta con indicar `language=...`
  (JavaScript viene predefinido).
- Capítulo de demostración (`chapters/00_examples.tex`) ampliado: texto, listas,
  imágenes ráster y SVG, subfiguras, tablas (`tabularx`, `\resizebox` y tabla
  girada con `\rotatebox`), página apaisada, notas al pie, código, ecuaciones,
  emojis, glosario/acrónimos y citas.
- **Esqueleto de secciones y comentarios-guía** en todos los capítulos
  (`chapters/01`–`09`), propios de una memoria de TFG.
- Ejemplos de referencias en `bibliography/bibliography.bib`: artículo, libro y
  recurso en línea.
- Sección de **créditos y agradecimientos** en el README y en la cabecera de
  `tfg_uc3m.sty`.

### Cambiado
- **Compilador unificado en LuaLaTeX + Biber** (recomendado y documentado).
- Tipografía gestionada con `fontspec` (TeX Gyre Heros y TeX Gyre Cursor),
  incrustada por completo en el PDF para garantizar la portabilidad.
- Versión del PDF normal forzada a **1.7** (LuaTeX usa 1.5 por defecto).
- **Comentarios bilingües** y revisados en todos los ficheros (español en este
  repositorio, inglés en `uc3m_tfg_latex_template_en`).
- README reescrito: estructura, personalización, generación de PDF/A y notas.
- Metadatos de la plantilla movidos de `tfg_vars.tex` a `tfg_template_info.tex`
  para separar lo que edita el alumnado de lo que mantiene quien actualiza la
  plantilla.

### Eliminado
- Paquetes sin uso: `pdflscape`, `rotating` y `floatrow`. Sus funciones se
  cubren con el entorno `tfglandscape`, con `\rotatebox` (de `graphicx`) y con
  `float`.
