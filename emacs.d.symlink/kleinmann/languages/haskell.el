;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))


;; Hooks
(add-hook 'haskell-mode-hook 'flyspell-prog-mode)
(add-hook 'haskell-mode-hook '(lambda ()
                                (subword-mode +1)
                                (turn-on-haskell-doc-mode)
                                (turn-on-haskell-indentation)))


;; Indentation


;; Minor modes


;; Misc
