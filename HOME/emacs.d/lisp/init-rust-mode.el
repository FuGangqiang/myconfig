(require 'rust-mode)
(require 'cargo)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook
	  (lambda ()
	    (eldoc-mode)
	    (cargo-minor-mode)
	    (lsp-rust-enable)
	    ;; (setq rust-format-on-save t)
	    (local-set-key (kbd "C-c <tab>") 'rust-format-buffer)
	    ))

(provide 'init-rust-mode)
