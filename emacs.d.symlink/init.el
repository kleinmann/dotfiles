;; -*- coding: utf-8 -*-
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(require 'cl)
;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *spell-check-support-enabled* nil)
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
;; Load packages first, so I can configure them wherever I want to
(load "kleinmann/packages")

(load "kleinmann/bindings")
(load "kleinmann/css")
(load "kleinmann/defuns")
(load "kleinmann/encoding")
(load "kleinmann/erc")
(load "kleinmann/filetypes")
(load "kleinmann/flyspell")
(load "kleinmann/general")
(load "kleinmann/git")
(load "kleinmann/misc")
(load "kleinmann/modes")
(load "kleinmann/org")
(when (file-exists-p (expand-file-name "~/.emacs.d/kleinmann/passwords.el")) (load "kleinmann/passwords"))
(load "kleinmann/ruby")
(load "kleinmann/shell")
(load "kleinmann/ui")

(load "scripts/taglist")
