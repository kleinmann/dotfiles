;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))


;; Hooks
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook '(lambda ()
                                   (turn-on-eldoc-mode)
                                   (rainbow-mode +1)
                                   (paredit-mode +1)))


;; Indentation


;; Minor modes


;; Misc
