;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

;; Hooks
(autoload 'css-mode "css-mode" nil t)
(add-hook 'css-mode-hook '(lambda ()
                            (setq css-indent-level 2)
                            (setq css-indent-offset 2)
                            (rainbow-mode +1)))
(add-hook 'css-mode-hook 'flyspell-prog-mode)

;; Indentation


;; Minor Modes


;; Misc

