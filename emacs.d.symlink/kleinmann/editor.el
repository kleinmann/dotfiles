;; -*- coding: utf-8 -*-
;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; auto-completion in minibuffer
(icomplete-mode +1)

;; ido-mode
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window)

;; enabled auto-fill mode in text-mode and all related modes
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; saner regex syntax
(require 're-builder)
(setq reb-re-syntax 'string)

(require 'sr-speedbar)
