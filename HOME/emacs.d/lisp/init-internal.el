(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode t)
(global-linum-mode t)
(delete-selection-mode t)
(mouse-avoidance-mode 'animate)
; (display-time-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)
(windmove-default-keybindings)

(setq debug-on-error t
      inhibit-startup-message t
      initial-scratch-message nil
      custom-file (expand-file-name "custom.el" user-emacs-directory)
      default-major-mode 'text-mode
      mark-ring-max 5000
      global-mark-ring-max 5000
      kill-ring-max 5000
      kill-whole-line t
      sentence-end "[.?!:]"
      show-paren-style 'expression
      set-mark-command-repeat-pop t
      ad-redefinition-action 'accept
      truncate-lines t
      require-final-newline t
      tab-width 4
      indent-tabs-mode nil
      ring-bell-function 'ignore
      x-select-enable-clipboard t
      vc-follow-symlinks t
      save-interprogram-paste-before-kill t
      yank-pop-change-selection t
      scroll-error-top-bottom t
      speedbar-show-unknown-files t
      ; display-time-format "%Y-%m-%d(%u) %H:%M"
      initial-frame-alist '((width . 100) (height . 35))
      semanticdb-default-save-directory "~/.cache/semanticdb"
      frame-title-format '("%S" (buffer-file-name "%f"
                                                  (dired-directory dired-directory "%b")))
      )


;; Put backup files neatly away
(let ((backup-dir "~/.cache/emacs/backups")
      (auto-saves-dir "~/.cache/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too

(custom-set-variables
 '(go-playground-basedir "~/Test/go-palyground")
 '(rust-playground-basedir "~/Test/rust-playground"))

(defun prelude-move-beginning-of-line (arg)
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key (kbd "C-a") 'prelude-move-beginning-of-line)

(global-set-key (kbd "<f12>") 'eshell)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-k") 'kill-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-\\") 'delete-blank-lines)
(global-set-key (kbd "M-|") 'just-one-space)
(global-set-key (kbd "M-\\") 'delete-horizontal-space)
(global-set-key (kbd "C-S-DEL") 'kill-whole-line)

(add-hook 'man-mode-hook
	  (lambda ()
	    (visual-line-mode t)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook
	  (lambda ()
	    (setq show-trailing-whitespace 1)))

(add-hook 'diff-mode-hook
	  (lambda ()
	    (setq-local whitespace-style
			'(face
			  tabs
			  tab-mark
			  spaces
			  space-mark
			  trailing
			  indentation::space
			  indentation::tab
			  newline
			  newline-mark))
	    (whitespace-mode 1)))

(add-hook 'comint-exec-hook
	  (lambda ()
	    (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)))

(provide 'init-internal)
