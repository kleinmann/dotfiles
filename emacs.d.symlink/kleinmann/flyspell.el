;; -*- coding: utf-8 -*-
(dolist (hook '(coffee-mode-hook
                emacs-lisp-mode-hook
                js2-mode-hook
                ruby-mode-hook
                python-mode-hook
                css-mode-hook
                haskell-mode-hook
                php-mode-hook
                nxhtml-mode-hook
                ))
  (add-hook hook 'flyspell-prog-mode))

(add-hook 'rcirc-mode-hook '(lambda ()
                              (ispell-change-dictionary "de")
                              (flyspell-mode)))
(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=fast"))
