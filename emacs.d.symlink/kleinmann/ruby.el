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

(autoload 'rhtml-mode "rhtml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
(add-hook 'rhtml-mode '(lambda ()
                         (define-key rhtml-mode-map (kbd "M-s") 'save-buffer)))

(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))


(autoload 'css-mode "css-mode" nil t)
(add-hook 'css-mode-hook '(lambda ()
                            (setq css-indent-level 2)
                            (setq css-indent-offset 2)))

(setq rinari-tags-file-name "TAGS")
