(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-internal)

(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(defconst required-packages
  '(
    autopair
    avy
    clean-aindent-mode
    company
    fic-mode
    fill-column-indicator
    ;; flycheck
    ;; flycheck-pos-tip
    helm
    highlight-indentation
    highlight-symbol
    multiple-cursors
    neotree
    rainbow-delimiters
    savekill
    solarized-theme
    monokai-theme
    volatile-highlights
    window-numbering
    ;; yasnippet
    ;; rg

    ;; csharp-mode

    ;; scss-mode
    ;; tern
    ;; company-tern
    ;; js2-mode
    ;; jquery-doc
    ;; emmet-mode
    ;; web-mode
    ;; company-web

    ;; csharp-mode
    ;; dotnet
    ;; omnisharp

    ;; lsp-mode
    ;; lsp-python
    ;; lsp-rust
    ;; company-lsp

    ;; cargo
    ;; racer
    ;; rust-mode
    ;; flycheck-rust
    ;; company-racer
    ;; rust-playground

    ;; go-mode
    ;; go-eldoc
    ;; company-go
    ;; go-playground

    ;; lua-mode
    markdown-mode
    ;; toml-mode
    yaml-mode

    ;; youdao-dictionary
    ))

(defun install-required-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))
(install-required-packages)

;; (load-theme 'solarized-dark t)
(load-theme 'monokai t)
(set-default-font "Source Code Pro")
(set-fontset-font "fontset-default" 'unicode "Source Han Sans CN")

(require 'init-helm-mode)

;; minor mode init
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-show-numbers t
      company-require-match nil
      company-begin-commands '(self-insert-command)
      company-idle-delay 0
      company-tooltip-align-annotations t
      company-minimum-prefix-length 2)
(global-set-key (kbd "TAB") 'company-indent-or-complete-common)
(setq company-backends '((company-files
			  company-keywords
			  company-semantic
			  company-capf
			  company-yasnippet)))


;; (require 'yasnippet)
;; (setq yas-snippet-dir '("~/.emacs.d/snippets"))
;; (yas-global-mode 1)

(require 'savekill)
(setq save-kill-file-name "~/.cache/emacs/kill-ring-saved.el")

(require 'avy)
(global-set-key (kbd "M-SPC") 'avy-goto-char)

(require 'window-numbering)
(window-numbering-mode)

(require 'autopair)
(autopair-global-mode)
(setq autopair-autowrap t)

(require 'neotree)
(global-set-key (kbd "<f1>") 'neotree-toggle)

(require 'highlight-symbol)
(global-set-key (kbd "M-m") 'highlight-symbol-at-point)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

(require 'multiple-cursors)
(global-unset-key (kbd "C-<down-mouse-3>"))
(global-set-key (kbd "C-<mouse-3>") 'mc/add-cursor-on-click)

(require 'volatile-highlights)
(volatile-highlights-mode t)

(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'fic-mode)
(add-hook 'prog-mode-hook 'fic-mode)

;; (require 'rg)
;; (rg-enable-default-bindings (kbd "M-s"))

;; (require 'youdao-dictionary)
;; (setq url-automatic-caching t)
;; (global-set-key (kbd "C-x y") 'youdao-dictionary-search-at-point)

(require 'fill-column-indicator)
(setq fci-rule-column 80)

;; (require 'flycheck)
;; (eval-after-load 'flycheck
;;   '(progn
;;     (flycheck-pos-tip-mode)))
;; (global-flycheck-mode)
;; (add-to-list 'display-buffer-alist
;;              `(,(rx bos "*Flycheck errors*" eos)
;; 	       (display-buffer-reuse-window display-buffer-in-side-window)
;; 	       (side            . bottom)
;; 	       (reusable-frames . visible)
;; 	       (window-height   . 0.33)))

;; (require 'init-lsp-mode)
;; (require 'init-markdown-mode)
;; (require 'init-python-mode)
;; (require 'init-csharp-mode)
;; (require 'init-go-mode)
;; (require 'init-rust-mode)
;; (require 'init-web-mode)
