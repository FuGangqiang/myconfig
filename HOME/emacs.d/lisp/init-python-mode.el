;; (defun python-compile ()
;;   "Use compile to run python programs."
;;   (interactive)
;;   (save-buffer)
;;   (compile (concat "python " (buffer-name)) t))

;; (defun run-python-once ()
;;   (remove-hook 'python-mode-hook 'run-python-once)
;;   (run-python (python-shell-parse-command)))

;; (add-hook 'python-mode-hook 'run-python-once)

(add-hook 'python-mode-hook
	  (lambda ()
	    ;; (setq python-shell-completion-native-enable nil)
	    ;; (define-key python-mode-map (kbd "<f5>") 'python-compile)
	    (lsp-python-enable)))

(provide 'init-python-mode)
