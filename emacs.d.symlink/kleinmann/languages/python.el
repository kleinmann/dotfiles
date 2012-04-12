;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))


;; Hooks
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook '(lambda ()
                               (electric-indent-mode -1)))


;; Indentation


;; Minor modes


;; Misc

