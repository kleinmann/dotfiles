;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))


;; Hooks
(add-hook 'haskell-mode-hook 'flyspell-prog-mode)
(add-hook 'haskell-mode-hook '(lambda ()
                                (subword-mode 1)
                                (turn-on-haskell-doc-mode)
                                (turn-on-eldoc-mode)
                                (local-set-key [return] 'newline-and-indent)))


;; Indentation


;; Minor modes


;; Misc
