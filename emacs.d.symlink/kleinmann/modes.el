;; -*- coding: utf-8 -*-
(pretty-lambda-for-modes)

(global-linum-mode 1)
(setq linum-format "%4d")

(global-undo-tree-mode)

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-misc)
(require 'helm-projectile)

(defun helm-prelude ()
  "Preconfigured `helm'."
  (interactive)
  (if (projectile-get-project-root)
      ;; add project files and buffers when in project
      (helm-other-buffer '(helm-c-source-projectile-files-list
                           helm-c-source-projectile-buffers-list
                           helm-c-source-buffers-list
                           helm-c-source-recentf
                           helm-c-source-buffer-not-found)
                         "*helm prelude*")
    ;; otherwise fallback to helm-mini
    (helm-mini)))

;; smart indenting and pairing for all
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

;; show-paren-mode: subtle highlighting of matching parens
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; highlight the current line
(global-hl-line-mode +1)

(require 'volatile-highlights)
(volatile-highlights-mode t)
