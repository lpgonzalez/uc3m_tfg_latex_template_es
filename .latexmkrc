# Configuración de latexmk para la plantilla TFG de la UC3M.
#   latexmk        genera tfg_main.pdf con LuaLaTeX + Biber
#   latexmk -c     elimina los ficheros auxiliares
#   latexmk -C     elimina los ficheros auxiliares y el PDF

$pdf_mode = 4;   # 4 = LuaLaTeX

# --shell-escape lo necesita el paquete svg (llama a Inkscape).
$lualatex = 'lualatex --shell-escape -interaction=nonstopmode -synctex=1 %O %S';

# biblatex usa Biber; latexmk lo detecta automáticamente desde el fichero .bcf.
