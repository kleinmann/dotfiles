;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))


;; Hooks
(add-hook 'coffee-mode-hook 'flyspell-prog-mode)
(add-hook 'coffee-mode-hook '(lambda ()
                               (electric-indent-mode -1)))


;; Indentation
(set (make-local-variable 'tab-width) 2)


;; Minor modes


;; Misc

