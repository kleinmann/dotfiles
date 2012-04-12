;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.scss$"))


;; Hooks
(add-hook 'scss-mode-hook '(lambda ()
                             ; turn off auto-compile on save
                             (setq scss-compile-at-save nil)))


;; Indentation


;; Minor modes


;; Misc
