;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))


;; Hooks
(add-hook 'php-mode-hook 'flymake-php-load)
(add-hook 'php-mode-hook 'flyspell-prog-mode)


;; Indentation
(setq php-indent-level 2)


;; Minor Modes


;; Misc
