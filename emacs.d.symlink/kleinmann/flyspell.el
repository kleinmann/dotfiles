;; -*- coding: utf-8 -*-
(dolist (hook '(coffee-mode-hook
                emacs-lisp-mode-hook
                js2-mode-hook
                ruby-mode-hook
                python-mode-hook
                css-mode-hook
                haskell-mode-hook
                ))
  (add-hook hook 'flyspell-prog-mode))
