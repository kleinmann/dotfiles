;; -*- coding: utf-8 -*-
(autoload 'ruby-mode "ruby-mode" nil t)

(add-hook 'ruby-mode-hook '(lambda ()
                             (setq ruby-deep-arglist t)
                             (setq ruby-deep-indent-paren nil)
                             (setq c-tab-always-indent nil)
                             (set (make-local-variable 'indent-tabs-mode) 'nil)
                             (set (make-local-variable 'tab-width) 2)
                             (require 'inf-ruby)
                             (require 'ruby-compilation)
                             (require 'ruby-electric)
                             (ruby-electric-mode t)))
;; fix yasnippet expand key
(add-hook 'ruby-mode-hook '(lambda()
                             (local-set-key (kbd "TAB") 'yas/expand)))

(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(autoload 'rhtml-mode "rhtml-mode" nil t)

(setq rinari-tags-file-name "TAGS")
