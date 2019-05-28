;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/elpa/use-package-20180715.1801")
  (require 'use-package))

(use-package ace-window
  :ensure t)
(use-package auto-package-update
  :ensure t)
(use-package tex
  :ensure auctex)
(use-package org-bullets
  :ensure t)
(use-package rainbow-mode
  :ensure t)
(use-package wolfram
  :ensure t)
(use-package better-defaults
  :ensure t)
(use-package pdf-tools
  :ensure t)
(use-package rainbow-delimiters
  :ensure t)
(use-package helm
  :ensure t)
(use-package flyspell
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package htmlize
  :ensure t)
(use-package org
  :ensure t)
(use-package god-mode
  :ensure t)
(use-package monokai-theme
  :ensure t)
(use-package f
  :ensure t)
(use-package names
  :ensure t)
(use-package gdscript-mode
  :ensure t)

;; (set-language-environment "Japanese")

(set-language-environment "UTF-8")

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

(setq column-number-mode t)

(defun my/general-comment-header (title)
  "Inserts a commented title"
  (interactive "sEnter a title: ")
  (defvar dash-len 1)
  (setq dash-len (/ (- 68 (length title)) 2))
  (insert comment-start)
  (indent-for-tab-command)
  (dotimes (ii dash-len)
    (insert "-"))
  (if (= (mod (length title) 2) 1)
      (insert "-")
    )
  (insert title)
  (dotimes (ii dash-len)
    (insert "-"))
  )
(global-set-key (kbd "H-h") 'my/general-comment-header)

(require 'wolfram)
(setq wolfram-alpha-app-id 'U2773W-V74GXV4HWX)

(set-face-attribute 'default nil :height 150)

(global-subword-mode)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

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

(use-package spaceline
  :ensure spaceline
  :custom-face
  (spaceline-highlight-face ((t (:background "SeaGreen4" :foreground "#3E3D31" :inherit (quote mode-line)))))
  (spaceline-unmodified ((t (:background "SeaGreen4" :foreground "#3E3D31" :inherit (quote mode-line)))))
  (spaceline-read-only ((t (:background "DarkOliveGreen" :foreground "#3E3D31" :inherit (quote mode-line)))))
  :config
  (spaceline-emacs-theme)
  (setq spaceline-minor-modes-p nil)
  (setq spaceline-buffer-size-p nil)
  (setq spaceline-buffer-encoding-abbrev-p nil)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-modified))

(defun my/visit-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "H-e") 'my/visit-emacs-config)

(defun my/visit-bash-config ()
  (interactive)
  (find-file "~/.bashrc"))
(global-set-key (kbd "H-M-e") 'my/visit-bash-config)

(global-set-key (kbd "M-]") 'other-window)

(global-set-key (kbd "M-[") 'other-frame)

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "H-]") 'ace-window)
(setq aw-keys '(?q ?w ?e ?a ?s ?d ?z ?x ?c))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))
(global-set-key (kbd "H-D") 'duplicate-current-line-or-region)

(defun my/open-term-other-window ()
    (interactive)
    (split-window-below -12)
    (other-window 1)
    (term "/bin/bash")
  )
(defun my/open-term-close-window ()
  (interactive)
  (switch-to-buffer-other-window "*terminal*")
  (kill-buffer-and-window)
)

(add-hook 'term-exec-hook 
      (lambda () (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)))

(global-set-key (kbd "H-t") 'my/open-term-other-window)
(global-set-key (kbd "H-M-t") 'my/open-term-close-window)

(global-set-key (kbd "H-f") 'window-split-toggle)

(defun my/get-line-number()
  "saves line number to a variable bbb"
  (interactive)
(end-of-buffer)
(previous-line)
(setq aaa (what-line))
(setq bbb (substring aaa 5))
)
(defun my/print-line-number()
  "prints line number"
  (interactive)
(insert bbb))

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

(global-set-key (kbd "C-=")  'text-scale-increase)
(global-set-key (kbd "C--")  'text-scale-decrease)

(require 'god-mode)
(global-set-key (kbd "H-;") 'god-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)

(helm-mode 1)
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(add-to-list 'custom-theme-load-path "~/.emacs.d/CustomTheme")
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

(defun InsertTemplate-quickTeX()
  "Insert quickTeX template"
  (interactive)  
  (insert-file "~/Dropbox/.templates/quickTeX.tex")
)
(defun InsertTemplate-reviewTeX()
  "Insert reivewTeX template"
  (interactive)  
  (insert-file "~/Dropbox/.templates/reviewTeX.tex")
)

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

(require 'flycheck)

(autoload 'f90-mode "f90" "Fortran 90 mode" t)

(defun InsertTemplate-Fortran()
(interactive)
(when (and
       (string-match "\\.f90$" (buffer-file-name))
       (eq 1 (point-max)))
  (insert-file "~/Dropbox/.templates/FortranTemplate.f90")))

(add-hook 'f90-mode-hook 'my-f90-mode-hook)
(add-hook 'f90-mode-hook 'InsertTemplate-Fortran)
(require 'fortran)
(defun my-f90-mode-hook () 
  (local-set-key (kbd "H-M-c") (lambda () (interactive) (shell-command "./BashFortran.sh")))
  (local-set-key (kbd "H-M-h") 'my/f90-comment-header-block)
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

(defun InsertTemplate-Python()
  (interactive)
  (when (and
  (string-match "\\.py$" (buffer-file-name))
  (eq 1 (point-max)))
  (insert-file "~/Dropbox/.templates/PythonTemplate.py")))

(require 'python)
(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'find-file-hooks 'InsertTemplate-Python)
(defun my-python-mode-hook()     
  (local-set-key (kbd "C-c C-r") 'python-shell-send-region)
  (setq python-shell-interpreter "/home/anthony/anaconda3/bin/ipython3"
        python-shell-interpreter-args "--simple-prompt -i")
  (abbrev-mode 1)                     
  )

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hh\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

(add-hook 'find-file-hooks 'InsertTemplate-C++)
(defun InsertTemplate-C++()
  (interactive)
  (when (and
  (string-match "\\.cpp$" (buffer-file-name))
  (eq 1 (point-max)))
  (insert-file "~/Dropbox/.templates/c++template.cpp")))

(require 'cl)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(defun my-c++-mode-hook ()
  (local-set-key (kbd "H-M-p")(lambda () (interactive) (shell-command "./bash_c++")))
  )

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
   (emacs-lisp . t)
   ))

(setq org-capture-templates
      (quote (("n" "Notes" entry (file "~/Dropbox/QMC/Notes/Notes.org")
               "* %? D/11/2018 \n** Contents \n \n** Notes \n \n** Resources ")        
              ("Q" "Question" entry (file "~/Dropbox/QMC/Notes/Questions.org")
               "* %?")
              )))

(setq org-agenda-files '("~/Dropbox/Other/"))

(global-set-key (kbd "H-/") 'org-tags-view)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n  ?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist
             '("c" "#+BEGIN_SRC C++\n  ?\n#+END_SRC"))
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

(setq org-ellipsis "⬎")

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

(setq org-latex-packages-alist '())
  (add-to-list 'org-latex-packages-alist '("" "mypackage" t))

(setq exec-path (append exec-path '("/usr/bin")))
(load "auctex.el" nil t t)
