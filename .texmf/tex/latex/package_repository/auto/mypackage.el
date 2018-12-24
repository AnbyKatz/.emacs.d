(TeX-add-style-hook
 "mypackage"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "amsmath"
    "amssymb"
    "physics"
    "slashed"
    "amsfonts"
    "color"
    "graphicx"
    "float"
    "hyperref"
    "tikz"
    "wrapfig"
    "lipsum"
    "simplewick"
    "listings"
    "mwe"
    "afterpage"
    "times"
    "esint")
   (TeX-add-symbols
    '("eqsplt" 1)
    '("eulerm" 1)
    '("eulerp" 1)
    '("infsum" 1)
    '("deltavb" 2)
    '("triint" 1)
    '("uvb" 1)
    '("m" 1)
    '("vbdot" 2)
    '("epsilondelta" 6)
    '("emftensorup" 2)
    '("emftensordown" 2)
    '("fs" 1)
    "dalem"
    "Lag"
    "Ham"
    "psibar"
    "pd"
    "einkx"
    "eikx"
    "kv"
    "sigmav"
    "gammav"
    "pinorm"
    "diracham"
    "gammazero"
    "gammaone"
    "gammatwo"
    "gammathree"
    "alphamatrix"
    "betamatrix"
    "dg"
    "pii"
    "ft"
    "infint"
    "inR"
    "inC"
    "inN"
    "numberthis"
    "Berlincount"
    "hi"
    "myDate"))
 :latex)

