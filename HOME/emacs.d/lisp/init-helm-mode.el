(require 'helm)
(require 'helm-config)
(require 'helm-grep)

(helm-mode 1)
(helm-autoresize-mode t)
(semantic-mode 1)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-x m") 'helm-man-woman)
(global-set-key (kbd "M-s") 'helm-occur)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-x C-r") 'helm-register)
;; (global-set-key (kbd "C-x r j") 'jump-to-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(define-key global-map [remap find-tag] 'helm-etags-select)
(define-key global-map [remap list-buffers] 'helm-buffers-list)

(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
     (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
     (define-key helm-map (kbd "C-z")  'helm-select-action)))

(require 'helm-eshell)
(add-hook 'eshell-mode-hook (lambda ()
                              (define-key eshell-mode-map (kbd "c-c c-l") 'helm-eshell-history)))
(add-hook 'shell-mode-hook (lambda ()
                             (define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)))

(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-ff-auto-update-initial-value     t
      helm-M-x-fuzzy-match                  t ; optional fuzzy matching for helm-M-x
      helm-buffers-fuzzy-matching           t
      helm-recentf-fuzzy-match              t
      helm-semantic-fuzzy-match             t
      helm-imenu-fuzzy-match                t)

(provide 'init-helm-mode)
