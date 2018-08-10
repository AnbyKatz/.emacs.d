(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

(global-set-key (kbd "H-S") 'window-split-toggle)

(when (memq window-system '(mac ns x))
(exec-path-from-shell-initialize))

(set-language-environment "Japanese")

(setq abbrev-file-name "~/.abbrev_defs")
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(add-to-list 'load-path "~/.emacs.d/elpa/")

(defun window-split-toggle ()
"Toggle between horizontal and vertical split with two windows."
(interactive)
(if (> (length (window-list)) 2)
    (error "Can't toggle with more than 2 windows!")
  (let ((func (if (window-full-height-p)
                  #'split-window-vertically
                #'split-window-horizontally)))
    (delete-other-windows)
    (funcall func)
    (save-selected-window
      (other-window 1)
      (switch-to-buffer (other-buffer))))))

(global-auto-revert-mode t)

(set-face-attribute 'default nil :height 150)

(global-subword-mode)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'foo-mode-hook #'rainbow-delimiters-mode)

(when (display-graphic-p)
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(tool-bar-mode 0)
(menu-bar-mode 0)
(when window-system
  (scroll-bar-mode -1))

(setq ring-bell-function 'ignore)

(setq scroll-conservatively 100)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) 
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(require 'better-defaults)

(setq display-time-string-forms '((propertize (format-time-string " %b %d, %l:%M%P" now) 'face'bold)))
(setq display-time-and-date t)
(display-time-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(defun my/visit-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "H-e") 'my/visit-emacs-config)

(global-set-key (kbd "H-r")  (lambda () (interactive) (find-file  "~/Dropbox/QMC/Thesis/MPhil_Research.tex")))
(global-set-key (kbd "H-j")  (lambda () (interactive) (find-file  "~/Dropbox/Journal/journal.org")))
(global-set-key (kbd "H-a")  (lambda () (interactive) (find-file  "~/Dropbox/Journal/agenda.org")))
(global-set-key (kbd "H-w")  (lambda () (interactive) (find-file  "~/Dropbox/QMC/My_QMC_Research/QMC_2018V1.f90")))
(global-set-key (kbd "H-t")  (lambda () (interactive) (find-file  "~/texmf/tex/latex/package_repository/mypackage.sty")))

(global-set-key (kbd "M-]") 'other-window)

(global-set-key (kbd "M-[") 'other-frame)

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "H-A") 'ace-window)

(global-set-key (kbd "H-s") 'helm-spotify-plus)

(defun my/repeat-last-shell-command()
  "repeats last run shell command"
  (interactive)
  (shell-command (cadr (assoc 'shell-command command-history))))
(global-set-key (kbd "M-Z") 'my/repeat-last-shell-command)

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (previous-line 1))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(helm-mode 1)
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(require 'helm-spotify-plus)

(add-to-list 'custom-theme-load-path "~/.emacs.d/anthony-swanking-theme")
(load-theme 'anthony-swanking t)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
(setq pdf-view-midnight-colors (cons (face-foreground 'default) (face-background 'default)))

(defun my-pdf-view-mode-hook ()
  (pdf-view-midnight-minor-mode 1)
  (linum-mode 0)
  )
(add-hook 'pdf-view-mode-hook 'my-pdf-view-mode-hook)
(pdf-tools-install)

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
	  #'TeX-revert-document-buffer)

(require 'tex)
(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)
(defun my-LaTeX-mode-hook ()
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  (visual-line-mode 1)
  (flyspell-mode 1)
  (LaTeX-math-mode 1)
  (TeX-source-correlate-mode 1)
  (outline-minor-mode 1)
  (local-set-key (kbd "C-M-=") '(lambda () (interactive) (insert "&= ")))
  (local-set-key (kbd "C-H-f") '(lambda () (interactive) (insert "frac{")))
  (local-set-key (kbd "C-c b") 'tex-latex-block)
  (local-set-key (kbd "<C-tab>") 'outline-toggle-children)
  )

(autoload 'f90-mode "f90" "Fortran 90 mode" t)

(add-hook 'f90-mode-hook 'my-f90-mode-hook)
(require 'fortran)
(defun my-f90-mode-hook () 
  (local-set-key (kbd "H-M-c") (lambda () (interactive) (shell-command "./bash_fortran")))
  (local-set-key (kbd "H-t") 'my/f90-comment-header-block)
  (setq f90-font-lock-keywords f90-font-lock-keywords-3)
  '(f90-comment-region "!!!$")
  '(f90-indented-comment-re "!")
  (abbrev-mode 1)                     
  (turn-on-font-lock)                 
  (auto-fill-mode 0)                  
)

(defun my/f90-comment-header-block (title)
  "Inserts a commented title block for f90"
  (interactive "sEnter a title: ")
  (defvar blank-len 1)
  (setq blank-len (/ (- 69 (length title)) 2))
  (newline)
  (dotimes (jj 5)
    (case jj
      ((0 4)
       (indent-for-tab-command)
       (insert "!")
       (dotimes (ii 69) (insert "-"))
       (insert "!")
       (newline))
      ((1 3)
       (indent-for-tab-command)
       (insert "!")
       (dotimes (ii 69) (insert " "))
       (insert "!")
       (newline))
      (2
       (indent-for-tab-command)
       (insert "!")
       (dotimes (ii blank-len)
	 (insert " "))
       (if (= (mod (length title) 2) 0)
	   (insert " ")
	 )
       (insert title)
       (dotimes (ii blank-len)
	 (insert " "))
       (insert "!")
       (newline))
  )))
(global-set-key (kbd "H-Z") 'my/f90-comment-header-block)

(defun numFort-recompile ()
  "Recompile personal FORTRAN numerical libraries"
  (interactive)
  (shell-command (concat "(cd /home/anthony/Dropbox/Code/Fortran/f90-toolbox/; ./recompile.sh") ))

(add-hook 'find-file-hooks 'my/template-insert-python)
(defun my/template-insert-python()
  (interactive)
  (when (and
  (string-match "\\.py$" (buffer-file-name))
  (eq 1 (point-max)))
  (insert-file "~/Dropbox/Templates/python_template.py")))

(require 'python)
(add-hook 'python-mode-hook 'my-python-mode-hook)
(defun my-python-mode-hook()     
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--simple-prompt -i")
  (add-to-list 'load-path "/folder/containing/file")
  )

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(add-hook 'find-file-hooks 'my/template-insert-C++)
(defun my/template-insert-C++()
  (interactive)
  (when (and
  (string-match "\\.cpp$" (buffer-file-name))
  (eq 1 (point-max)))
  (insert-file "~/Dropbox/Templates/c++template.cpp")))

(require 'cl)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(defun my-c++-mode-hook ()
  (local-set-key (kbd "H-M-p")(lambda () (interactive) (shell-command "./bash_c++")))
  )

(require 'julia-mode)
(add-hook 'julia-mode-hook 'my-Julia-mode-hook)
(defun my-Julia-mode-hook()
  (local-set-key (kbd "C-c C-p") 'inferior-julia-shell)
  (local-set-key (kbd "C-c C-r") 'julia-shell-run-region)
  (local-set-key (kbd "H-M-p") 'my/julia-compile) 
  )

(defun my/julia-compile()
  (interactive)
  (defvar thisfile buffer-file-name)
  (shell-command (concat "julia " thisfile)))

(add-to-list 'load-path "~/.emacs.d/elpa/julia-mode-20171116.642")

(setq  inferior-julia-program-name "~/bin/julia/bin/julia")

(defun julia-repl ()
  "Runs Julia in a screen session in a `term' buffer."
  (interactive)
  (require 'term)
  (let ((termbuf (apply 'make-term "Julia REPL" "screen" nil (split-string-and-unquote "julia"))))
    (set-buffer termbuf)
    (term-mode)
    (term-char-mode)
    (switch-to-buffer termbuf)))
(global-set-key (kbd "C-x j") 'julia-repl)

(defun my-org-mode-hook ()
  (setq org-log-done t)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (visual-line-mode 1)
  (org-indent-mode 1)
  (org-bullets-mode 1)
  (abbrev-mode 1)
  ;; (linum-mode 1)
)

(autoload 'org-mode "org" "Org Mode" t)
(add-hook 'org-mode-hook 'my-org-mode-hook)

(require 'ob-clojure)
(require 'ox-latex)
(require 'org)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (fortran . t)
   (latex . t)
   (shell . t)
   (julia . t)
   (emacs-lisp . t)
   ))

(setq org-capture-templates
      (quote (("m" "Meeting Notes" entry (file+olp+datetree "~/Dropbox/Journal/journal.org")
               "* %? :Meeting: \n\n_Notes_:  \n \n_Agenda_: \n \n_Resources_: ")
              ("j" "Journal" entry (file+olp+datetree "~/Dropbox/Journal/journal.org")
               "* %? \n\n_Notes_:  \n \n_Resources_:")
              ("r" "Research Talk" entry (file+olp+datetree "~/Dropbox/Journal/journal.org")
               "* %? :RT: \n\n_Notes_:  \n \n_Resources_:")
              ("Q" "Meeting Question" entry (file+olp+datetree "~/Dropbox/Journal/questions.org")
               "* %?")
              )))

(setq org-agenda-files 
  (list "~/Dropbox/Journal/agenda.org" "~/Dropbox/Journal/journal.org"))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n  ?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
             '("c" "#+BEGIN_SRC C++\n  ?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
             '("py" "#+BEGIN_SRC python
#!/usr/bin/python3.5
import matplotlib.pyplot as pypl
import numpy as np
import math as m
from matplotlib import rc
?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
             '("ipy" "#+BEGIN_SRC ipython :session :exports both :results raw drawer\n  ?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
             '("f" "#+BEGIN_SRC fortran\n  ?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
             '("y" "#+BEGIN_SRC yaml\n  ?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
             '("sh" "#+BEGIN_SRC shell\n  ?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
             '("t" "#+BEGIN_SRC text\n  ?\n#+END_SRC"))

(setq org-export-with-smart-quotes t)

(setq org-confirm-babel-evaluate nil)

(require  'htmlize)

(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-window-setup 'current-window)

(setq org-startup-indented t)

(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("➢" "➣" "➤" "➟" "➙" "»"))

(setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)") ;
                          (sequence "⚑ WAITING(w)" "|")
                          (sequence "|" "💀 DEAD(d)")
                          ))

; allow for export=>beamer by placing

;; #+LaTeX_CLASS: beamer in org files
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
  ;; beamer class, for presentations
  '("beamer"
     "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n          
       \\subject{{{{beamersubject}}}}\n"

     ("\\section{%s}" . "\\section*{%s}")
     
     ("\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}"
       "\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}")))

  ;; letter class, for formal letters

  (add-to-list 'org-export-latex-classes

  '("letter"
     "\\documentclass[11pt]{letter}\n
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{color}"
     
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-structure-template-alist
'("beamer" "#+TITLE: \n#+AUTHOR: Anthony Kalaitzis \n#+OPTIONS: H:2 toc:t num:t \n#+LATEX_CLASS: beamer \n#+LATEX_CLASS_OPTIONS: [presentation] \n#+LATEX_header: \n#+BEAMER_header: \\usetheme{Berlin} \n#+BEAMER_header: \\usecolortheme[named=purple]{structure} \n#+COLUMNS: %45ITEM %10BEAMER_ENV(Env) %10BEAMER_ACT(Act) %4BEAMER_COL(Col) %8BEAMER_OPT(Opt) \n?"))

(setq org-latex-packages-alist '())
(add-to-list 'org-latex-packages-alist '("" "mypackage" t))

(setq exec-path (append exec-path '("/usr/bin")))
(load "auctex.el" nil t t)

(require 'wolfram)
(setq wolfram-alpha-app-id 'U2773W-V74GXV4HWX)
