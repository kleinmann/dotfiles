;; -*- coding: utf-8 -*-
(push "/usr/local/bin" exec-path)
(setq make-backup-files nil)
(setq auto-save-default nil)
(delete-selection-mode t)
(scroll-bar-mode -1)
(set-fringe-style -1)
(tooltip-mode -1)

;; Set default directory to ~/code if it exists.
(if (file-exists-p "~/code") (setq default-directory "~/code"))

;; Disable bell for several commands
(setq ring-bell-function
      (lambda ()
	(unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit
                                mwheel-scroll down up next-line previous-line
                                backward-char forward-char keyboard-escape-quit
                                scroll-down-command scroll-up-command))
	  (ding))))

;; Remap command to meta on OS X
(when *is-a-mac*
  (setq mac-command-modifier 'meta
        mac-option-modifier 'none
        default-input-method "MacOSX")
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(0.001)))

;; no tabs and two spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
