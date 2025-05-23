; setup straight --- package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

; only show serious warnings
(setq warning-minimum-level :error)

; use lsp-mode
(straight-use-package 'lsp-mode)
(use-package lsp-ui
  :commands lsp-ui-mode
  :straight t)

(add-hook 'python-mode-hook 'lsp-deferred)
