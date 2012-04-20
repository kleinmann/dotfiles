;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))

;; Hooks
(add-hook 'ruby-mode-hook '(lambda ()
                             (setq ruby-deep-arglist t)
                             (setq ruby-deep-indent-paren nil)
                             (setq c-tab-always-indent nil)
                             (set (make-local-variable 'indent-tabs-mode) 'nil)
                             (set (make-local-variable 'tab-width) 2)
                             (require 'ruby-compilation)
                             (setq ruby-use-encoding-map nil)
                             ))
(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))
(add-hook 'ruby-mode-hook 'flyspell-prog-mode)
(add-hook 'ruby-mode-hook '(lambda ()
                             (require 'ruby-block)
                             (ruby-block-mode t)

                             (require 'ruby-end)
                             ))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")


;; Indentation
(setq ruby-indent-level 2)


;; Minor modes
(setq rinari-tags-file-name "TAGS")
(setq rinari-major-modes
      (list 'dired-mode-hook 'ruby-mode-hook 'css-mode-hook 'yaml-mode-hook
            'js2-mode-hook))

(autoload 'rhtml-mode "rhtml-mode" nil t)

;; Misc
;; Clear the compilation buffer between test runs.
(eval-after-load 'ruby-compilation
                 '(progn
                    (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
                               (let ((comp-buffer-name (format "*%s*" name)))
                                 (when (get-buffer comp-buffer-name)
                                   (with-current-buffer comp-buffer-name
                                                        (delete-region (point-min) (point-max))))))
                    (ad-activate 'ruby-do-run-w/compilation)))
