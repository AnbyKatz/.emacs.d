(server-start)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(let ((file-name-handler-alist nil)) 
  ;; Put custom settings in separate file.
  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file :noerror)
  
  ;; don't ask user to confirm emacs-lisp execution
  (defun my-org-confirm-babel-evaluate (lang body)
    (not (string= lang "emacs-lisp")))  
  (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
  (org-babel-load-file "~/.emacs.d/config.org")
)
