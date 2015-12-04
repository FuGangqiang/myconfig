(require 'lsp-mode)

(with-eval-after-load 'lsp-mode
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (require 'lsp-rust)
  (require 'lsp-python)
  (require 'lsp-flycheck)
  (require 'company-lsp)
  (add-to-list (make-local-variable 'company-backends) 'company-lsp)
  )

(provide 'init-lsp-mode)
