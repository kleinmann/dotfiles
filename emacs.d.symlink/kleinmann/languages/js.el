;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; Hooks
(add-hook 'js2-mode-hook 'flyspell-prog-mode)
(add-hook 'js2-mode-hook '(lambda ()
                            (electric-layout-mode -1)
                            (setq js2-cleanup-whitespace t)
                            (setq js2-basic-offset 2)
                            (setq js2-bounce-indent-p t)))


;; Indentation
(setq js-indent-level 2)


;; Minor modes


;; Misc
