;; -*- coding: utf-8 -*-
(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=fast"))
(add-hook 'message-mode-hook '(lambda ()
                                (flyspell-mode +1)))
(add-hook 'text-mode-hook '(lambda ()
                             (flyspell-mode +1)))
