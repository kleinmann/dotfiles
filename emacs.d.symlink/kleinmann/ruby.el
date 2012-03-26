;; -*- coding: utf-8 -*-
(add-hook 'ruby-mode-hook '(lambda ()
                             (setq ruby-deep-arglist t)
                             (setq ruby-deep-indent-paren nil)
                             (setq c-tab-always-indent nil)
                             (set (make-local-variable 'indent-tabs-mode) 'nil)
                             (set (make-local-variable 'tab-width) 2)
                             (require 'ruby-compilation)
                             (setq ruby-use-encoding-map nil)
                             ))

(add-hook 'ruby-mode-hook 'inf-ruby-keys)

;; fix yasnippet expand key
(add-hook 'ruby-mode-hook '(lambda()
                             (local-set-key (kbd "TAB") 'yas/expand)))

(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(autoload 'rhtml-mode "rhtml-mode" nil t)

(setq rinari-tags-file-name "TAGS")
;; Rinari (Minor Mode for Ruby On Rails)
(setq rinari-major-modes
      (list 'dired-mode-hook 'ruby-mode-hook 'css-mode-hook 'yaml-mode-hook
            'js2-mode-hook))

;; Clear the compilation buffer between test runs.
(eval-after-load 'ruby-compilation
  '(progn
     (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
       (let ((comp-buffer-name (format "*%s*" name)))
         (when (get-buffer comp-buffer-name)
           (with-current-buffer comp-buffer-name
             (delete-region (point-min) (point-max))))))
     (ad-activate 'ruby-do-run-w/compilation)))