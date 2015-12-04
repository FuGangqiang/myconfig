(require 'company-go)

(add-hook 'go-mode-hook
	  (lambda ()
	    (go-eldoc-setup)
	    (setq default-tab-width 4)
	    (local-set-key (kbd "C-c C-g") 'go-goto-imports)
	    (local-set-key (kbd "C-c C-f") 'gofmt)
	    (local-set-key (kbd "C-c C-k") 'godoc)
	    (local-set-key (kbd "M-.") 'godef-jump)
	    (local-set-key (kbd "C-M-.") 'godef-jump-other-window)
	    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
	    (add-to-list (make-local-variable 'company-backends) 'company-go)
	    (add-hook 'before-save-hook 'gofmt-before-save)
	    ))

(provide 'init-go-mode)
