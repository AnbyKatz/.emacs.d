;; Init.el file, initializes emacs
(server-start)

(let ((file-name-handler-alist nil)) 
  ;; Load custom File
  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file :noerror)
  
  ;; Load org file
  (defun my-org-confirm-babel-evaluate (lang body)
    (not (string= lang "emacs-lisp")))  
  (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
  (org-babel-load-file "~/.emacs.d/config.org")

  ;; EL file version
  ;; (load-file "~/.emacs.d/config.el")
)
