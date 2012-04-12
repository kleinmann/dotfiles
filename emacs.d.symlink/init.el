;; -*- coding: utf-8 -*-
(setq kleinmann-emacsd-dir (expand-file-name "~/.emacs.d"))
(setq kleinmann-config-dir (expand-file-name "kleinmann" kleinmann-emacsd-dir))
(setq kleinmann-vendor-dir (expand-file-name "vendor" kleinmann-emacsd-dir))

(add-to-list 'load-path kleinmann-emacsd-dir)
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
; Add external projects to load path
(add-to-list 'load-path kleinmann-vendor-dir)
(dolist (project (directory-files kleinmann-vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(if (file-exists-p kleinmann-config-dir)
    (dolist (file (directory-files kleinmann-config-dir t "\.el$"))
      (load file)))

(load "scripts/taglist")
