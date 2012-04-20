;; -*- coding: utf-8 -*-
;; the toolbar is just a waste of valuable screen estate
;; in a tty tool-bar-mode does not properly auto-load, and is
;; already disabled anyway
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
;; the menu bar is mostly useless as well
;; but removing it under OS X doesn't make much sense
(defun prelude-frame-config (frame)
  "Custom behaviours for new frames."
  (if (eq system-type 'darwin)
      (with-selected-frame frame
        (if (display-graphic-p)
            (modify-frame-parameters frame '((menu-bar-lines . 1)))
          (modify-frame-parameters frame '((menu-bar-lines . 0)))))
    (menu-bar-mode -1)))

;; run now
(prelude-frame-config (selected-frame))
;; and later
(add-hook 'after-make-frame-functions 'prelude-frame-config)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-step 1
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; show extra whitespace
(setq show-trailing-whitespace t)

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

;; use solarized-light as the default theme
(load-theme 'solarized-dark t)
(set-frame-font "Inconsolata 12")

(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 2)            ;; but maintain correct appearance
