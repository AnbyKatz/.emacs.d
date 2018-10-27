;;; ipython-shell-send-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ipython-shell-send" "ipython-shell-send.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ipython-shell-send.el

(autoload 'ipython-shell-send-region "ipython-shell-send" "\
Send the region delimited by START and END to inferior IPython process.
When optional argument SEND-MAIN is non-nil, allow execution of
code inside blocks delimited by \"if __name__== \\='__main__\\=':\".
When called interactively SEND-MAIN defaults to nil, unless it's
called with prefix argument.  When optional argument MSG is
non-nil, forces display of a user-friendly message if there's no
process running; defaults to t when called interactively.

\(fn START END &optional SEND-MAIN MSG)" t nil)

(autoload 'ipython-shell-send-buffer "ipython-shell-send" "\
Send the entire buffer to inferior IPython process.
When optional argument SEND-MAIN is non-nil, allow execution of
code inside blocks delimited by \"if __name__== \\='__main__\\=':\".
When called interactively SEND-MAIN defaults to nil, unless it's
called with prefix argument.  When optional argument MSG is
non-nil, forces displa qqy of a user-friendly message if there's no
process running; defaults to t when called interactively.

\(fn &optional SEND-MAIN MSG)" t nil)

(autoload 'ipython-shell-send-defun "ipython-shell-send" "\
Send the current defun to inferior IPython process.
When argument ARG is non-nil do not include decorators.  When
optional argument MSG is non-nil, forces display of a
user-friendly message if there's no process running; defaults to
t when called interactively.

\(fn &optional ARG MSG)" t nil)

(autoload 'ipython-shell-send/run-jupyter-existing "ipython-shell-send" "\
Run existing Jupyter kernel within inferior Python buffer.

Prompts for an existing kernel, then opens it in the standard
inferior Python buffer from python.el.  For example, the kernel
may correspond to a running Jupyter notebook, or may have been
started manually with the 'jupyter console' command.  Leaving
the prompt blank will select the most recent kernel.

To connect to a remote kernel, call this function from within
a Tramp buffer on the remote machine.

When called interactively with `prefix-arg', it allows the
user to edit such choose whether the interpreter
should be DEDICATED for the current buffer.  When numeric
prefix arg is other than 0 or 4 do not SHOW.

\(fn DEDICATED SHOW)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ipython-shell-send" '("ipython-shell-send")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ipython-shell-send-autoloads.el ends here
