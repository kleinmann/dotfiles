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
(load "kleinmann/bindings")
(load "kleinmann/encoding")
(load "kleinmann/filetypes")
(load "kleinmann/general")
(load "kleinmann/packages")
(load "kleinmann/ui")

(load "kleinmann/modes")
(load "kleinmann/git")
(load "kleinmann/org")
(load "kleinmann/ruby")
(load "kleinmann/shell")

(load "scripts/taglist")
