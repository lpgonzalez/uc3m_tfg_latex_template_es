# uc3m_tfg_latex_template_es

[![Licencia: MIT](https://img.shields.io/badge/Licencia-MIT-yellow)](LICENSE)
[![Última versión](https://img.shields.io/github/v/release/lpgonzalez/uc3m_tfg_latex_template_es)](https://github.com/lpgonzalez/uc3m_tfg_latex_template_es/releases)
[![Hecho con LuaLaTeX](https://img.shields.io/badge/Hecho%20con-LuaLaTeX-008080)](https://www.luatex.org/)

Plantilla en LaTeX para los **Trabajos de Fin de Grado (TFG)** de la Universidad
Carlos III de Madrid (UC3M). Versión en español. La versión en inglés está
disponible en [uc3m_tfg_latex_template_en](https://github.com/lpgonzalez/uc3m_tfg_latex_template_en).

La plantilla cumple las normas de formato de la UC3M (papel A4, márgenes de
2,5 cm superior/inferior y 3 cm izquierdo/derecho, interlineado 1,15) y genera
un PDF con metadatos incrustados (título, autor, asunto, palabras clave).

---

## Requisitos

Esta plantilla **debe compilarse con LuaLaTeX** (usa `fontspec`, `microtype`,
`emoji` y `svg`) y con **Biber** para la bibliografía. La tipografía principal
por defecto es *TeX Gyre Heros* (una fuente libre compatible con Arial/Helvetica
incluida en TeX Live y en Overleaf), por lo que no hay que instalar ningún
fichero de fuente.

---

## Cómo compilar

### En Overleaf (recomendado)

1. Sube el proyecto (o impórtalo desde GitHub).
2. Abre **Menú → Configuración** y selecciona:
   - **Compilador:** `LuaLaTeX`
   - **Documento principal:** `tfg_main.tex`
   - **Versión de TeX Live:** una reciente.
3. Pulsa **Recompilar**. Biber se ejecuta automáticamente.

> El paquete `svg` necesita Inkscape y shell-escape; ambos están disponibles en
> Overleaf, así que las figuras SVG funcionan sin configurar nada (la primera
> compilación puede ser más lenta).

### En local

Necesitas una distribución de TeX reciente (TeX Live / MiKTeX), **Biber** e
**Inkscape** (para el paquete `svg`). Se incluye un fichero `.latexmkrc`, así que
basta con ejecutar:

```bash
latexmk           # genera tfg_main.pdf con LuaLaTeX + Biber
latexmk -c        # elimina los ficheros auxiliares
latexmk -C        # elimina los ficheros auxiliares y el PDF
```

O, sin latexmk:

```bash
lualatex --shell-escape tfg_main
biber tfg_main
lualatex --shell-escape tfg_main
lualatex --shell-escape tfg_main
```

---

## Estructura del proyecto

```
tfg_main.tex            Documento principal (solo orquestación)
tfg_vars.tex            Tus datos: título, autor, tutor, licencia, etc.
tfg_template_info.tex   Metadatos de la plantilla (versión/procedencia); no lo tocas como alumno
tfg_uc3m.sty            Paquete de estilo: paquetes, maquetación, fuentes, metadatos
tfg_coverpage.sty       Portada (\makecover)
.latexmkrc              Configuración de compilación local (LuaLaTeX + Biber)
OpenMoji-color-glyf_colr_0.ttf   Fuente de emoji a color vectorial; ver Notas

bibliography/
  bibliography.bib      Tus referencias (BibLaTeX)

chapters/
  00_examples.tex       Capítulo de demostración (elimínalo en la versión final)
  01_introduction.tex
  02_soa.tex            Estado del arte
  03_method.tex
  04_validation.tex
  05_resultsanddiscussion.tex
  06_projectmanagement.tex
  07_conclusions.tex
  08_futurelines.tex
  09_annexes.tex

others/
  acks.tex              Agradecimientos / dedicatoria
  resumen.tex           Resumen (español)
  abstract.tex          Abstract (inglés) - exigido por la UC3M
  glossary.tex          Entradas del glosario y de los acrónimos

images/
  coverpage/            Logotipos de la UC3M y de la licencia
  examples/             Imágenes usadas por el capítulo de demostración
```

---

## Cómo personalizarla

1. **Tus datos:** edita `tfg_vars.tex` (título, autor, tutor, titulación, curso
   académico, lugar y fecha, palabras clave). Estos valores alimentan también
   los metadatos del PDF.
2. **Licencia:** asigna a `\licenseType` el valor `cc` (Creative Commons,
   recomendada) o `reserved` (todos los derechos reservados).
3. **Estilo de bibliografía:** asigna a `\bibStyle` el valor `ieee` o `apa`.
   Añade tus referencias a `bibliography/bibliography.bib`.
4. **Tipografía:** la fuente principal se define en `tfg_uc3m.sty`. Para usar una
   serif tipo Times, sustituye `TeX Gyre Heros` por `TeX Gyre Termes`.
5. **Colores:** los valores de color están en la sección *COLORES* al final de
   `tfg_vars.tex` (la mayoría no necesitará cambiarlos).
6. **Contenido:** escribe cada capítulo en `chapters/` (vienen con un esqueleto
   de secciones y comentarios-guía propios de una memoria de TFG) y los
   resúmenes en `others/`. Para ocultar el capítulo de demostración antes de
   entregar, pon `\showDemoChapter` a `false` en `tfg_vars.tex` (puedes borrar
   también `00_examples.tex`).

---

## Salida PDF/A para depósito (e-Archivo)

El repositorio de la UC3M (e-Archivo) solicita un fichero PDF/A, un formato de
preservación a largo plazo con fuentes y metadatos incrustados. Para generarlo:

1. Pon `\showDemoChapter` a `false` en `tfg_vars.tex` para ocultar el capítulo de
   demostración (es contenido de ejemplo) y escribe tu contenido real.
2. Al principio de `tfg_main.tex`, pon `\pdfaOutput` a `true`.
3. Recompila. El título, autor, asunto y palabras clave de `tfg_vars.tex` se
   incrustan como metadatos XMP automáticamente.
4. Valida el resultado con [veraPDF](https://verapdf.org) o Adobe Preflight
   antes de entregar.

Usamos el nivel **A-2b** (no el más estricto A-1b) porque admite la
transparencia presente en los logotipos SVG. Mantenlo desactivado mientras
trabajas y actívalo solo para el fichero final.

## Notas

- Usa `\gls{...}` para los acrónimos y términos del glosario definidos en
  `others/glossary.tex`.
- Referencia los capítulos con sus etiquetas ASCII, p. ej. `\ref{ch:introduction}`.
- Resalta código: indica el lenguaje en cada bloque, p. ej.
  `\begin{lstlisting}[language=Python]` (también C++, Java, HTML, SQL, bash...).
  Un único esquema colorea todos los lenguajes; JavaScript viene predefinido.
- Para tablas anchas tienes `tabularx` (ajuste de línea),
  `\resizebox{\textwidth}{!}{...}` (reescalado) y `\rotatebox{90}{...}` (girar
  una tabla en su sitio). Para una **página apaisada** (horizontal), envuelve el
  contenido en `\begin{tfglandscape} ... \end{tfglandscape}`: sirve para tablas,
  figuras o texto muy anchos, conserva encabezado y pie, y funciona también en
  PDF/A. Tienes ejemplos de todo en el capítulo de demostración.
- Todas las fuentes (incluidos los emojis) se incrustan en el PDF y en el PDF/A,
  por lo que el documento es portable y se ve igual en cualquier visor o
  dispositivo.
- Los emojis usan la fuente vectorial OpenMoji (`OpenMoji-color-glyf_colr_0.ttf`
  en la raíz del proyecto); consérvala y súbela, o la plantilla recurrirá a
  Noto Color Emoji (mapa de bits).
- Los metadatos del PDF guardan la plantilla: define `\templateRepo`,
  `\templateAuthor`, `\templateContributors`, `\templateVersion`,
  `\templateDate` y `\templateComments` en `tfg_template_info.tex`. Aparecen como
  propiedades personalizadas `Template.*` (Adobe → Propiedades del documento →
  Custom); la URL va además en el campo Creator.
- El capítulo de demostración muestra texto, listas, imágenes (ráster y SVG),
  tablas, código fuente, ecuaciones, emojis, términos del glosario y citas.
- Convención: lo parametrizado vive en `others/` y en los ficheros `.sty`; los
  capítulos de prosa libre y los anexos adicionales, en `chapters/`. Para
  añadir un anexo distinto al de IA, crea un fichero en `chapters/` e inclúyelo
  con `\input` en `tfg_main.tex` tras `chapters/09_annexes`.

---

## Créditos y agradecimientos

Plantilla basada en la plantilla oficial de TFG de la Universidad Carlos III de
Madrid, con influencias de otras plantillas, fragmentos de código LaTeX de
dominio público, desarrollos propios, y sugerencias y mejoras aportadas por
antiguos alumnos, además de diversas optimizaciones.

A todas las alumnas y alumnos —pasados, presentes y futuros— que confiaron,
confían y confiarán en mí como tutor de TFG/TFM, y que me inspiraron para
rescatar, refactorizar y mejorar esta plantilla hasta su estado actual, con el
fin de facilitarles el desarrollo de su trabajo de fin de etapa. Gracias también
a la comunidad de LaTeX por su extenso soporte, a las herramientas y plataformas
que hacen posible la edición colaborativa de LaTeX, y a quienes crearon LaTeX.

---

## Licencia

Esta plantilla se distribuye bajo la licencia **MIT** (ver [LICENSE](LICENSE)):
puedes usarla, modificarla y redistribuirla libremente, incluido tu propio TFG.
