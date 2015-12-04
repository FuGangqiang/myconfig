(require 'web-mode)
(require 'company-web-html)
(require 'company-tern)
(require 'js2-mode)


(setq js-indent-level 2)
(setq js2-basic-offset 2)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))

(add-hook 'html-mode-hook 'emmet-mode)

(dolist (hook '(js-mode-hook js2-mode-hook js3-mode-hook inferior-js-mode-hook))
  (add-hook hook
            (lambda ()
              (tern-mode t)
              (add-to-list (make-local-variable 'company-backends) 'company-tern)
              )))

(add-hook 'web-mode-hook
	  (lambda ()
	    (setq web-mode-markup-indent-offset 2
		  web-mode-css-indent-offset 2
		  web-mode-code-indent-offset 2
		  web-mode-style-padding 1
		  web-mode-script-padding 1
		  web-mode-block-padding 0
		  web-mode-enable-part-face t
		  web-mode-enable-css-colorization t
		  web-mode-enable-current-element-highlight t
		  web-mode-enable-current-column-highlight t
		  web-mode-enable-auto-pairing t
		  web-mode-enable-auto-closing t
		  )
	    (add-to-list (make-local-variable 'company-backends) 'company-web-html)
	    ))


(provide 'init-web-mode)
