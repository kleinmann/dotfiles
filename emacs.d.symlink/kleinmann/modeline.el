;; -*- coding: utf-8 -*-
;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

(setq my-mode-line-position
      (list
       "("
       (propertize "%02l:" 'face 'font-lock-type-face)
       (propertize "%02c" 'face 'font-lock-type-face) ", "
       (propertize "%p / %I" 'face 'font-lock-type-face)
       ")"))
(setq my-mode-line-major-mode
      (list
       "<"
       (propertize mode-name 'face 'font-lock-type-face)
       ">"))
(setq my-mode-line-directory
      (list
       (eval (shorten-directory default-directory 30))
       'face 'mode-line-directory-face))
(setq my-mode-line-buffer-name
      (list
       (propertize "%b" 'face 'mode-line-filename-face)))
(setq my-mode-line-vc
      (list
       (vc-mode vc-mode)))

;(setq-default mode-line-format
;      (list
;       my-mode-line-position
;       "  "
;       my-mode-line-major-mode
;       "  "
;       "["
;       mode-line-modified
;       "]"
;       "  "
;       my-mode-line-directory
;       my-mode-line-buffer-name
;       ))

(make-face 'mode-line-directory-face)
(make-face 'mode-line-filename-face)

(set-face-attribute 'mode-line-directory-face nil
    :inherit 'mode-line-face
    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#eab700"
    :weight 'bold)
