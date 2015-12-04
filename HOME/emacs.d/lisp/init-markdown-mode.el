(defun insert-blog-header ()
  (interactive)
  (insert (concat "date: "
                  (format-time-string "%Y-%m-%d %H:%M:%S" (current-time))
                  "\n"))
  (insert (concat "tags: "
		  (read-from-minibuffer "tags: "))))

(add-hook 'markdown-mode-hook
          '(lambda ()
             (define-key markdown-mode-map (kbd "C-c b") 'insert-blog-header)))

(provide 'init-markdown-mode)
