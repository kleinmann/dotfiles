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
