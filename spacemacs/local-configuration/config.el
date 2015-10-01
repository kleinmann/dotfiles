;;; extensions.el --- local-configuration Layer config File for Spacemacs
;;
;; Author: Uwe Kleinmann <uwe@kleinmann.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(setq paradox-github-token (getenv "PARADOX_GITHUB_TOKEN"))

(setq ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=fast"))

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "ma") 'neotree-create-node)
            (define-key evil-normal-state-local-map (kbd "md") 'neotree-delete-node)
            (define-key evil-normal-state-local-map (kbd "mr") 'neotree-rename-node)))

(when (require 'multi-term nil t)
  (global-set-key (kbd "<C-next>") 'multi-term-next)
  (global-set-key (kbd "<C-prior>") 'multi-term-prev)
  (setq multi-term-buffer-name "term"
        multi-term-program (if (file-exists-p "/usr/local/bin/zsh") "/usr/local/bin/zsh" "/bin/zsh")))
(when (require 'term nil t) ; only if term can be loaded..
  (setq term-bind-key-alist
        (list (cons "C-c C-c" 'term-interrupt-subjob)
              (cons "C-p" 'previous-line)
              (cons "C-n" 'next-line)
              (cons "M-f" 'term-send-forward-word)
              (cons "M-b" 'term-send-backward-word)
              (cons "C-c C-j" 'term-line-mode)
              (cons "C-c C-k" 'term-char-mode)
              (cons "M-DEL" 'term-send-backward-kill-word)
              (cons "M-d" 'term-send-forward-kill-word)
              (cons "<C-left>" 'term-send-backward-word)
              (cons "<C-right>" 'term-send-forward-word)
              (cons "C-r" 'term-send-reverse-search-history)
              (cons "M-p" 'term-send-raw-meta)
              (cons "M-y" 'term-send-raw-meta)
              (cons "C-y" 'term-send-raw))))

; GRB: split the windows
;(add-hook 'after-make-frame-functions
;          'kleinmann-default-windows)
;(defun kleinmann-default-windows (frame)
;  (progn
;          ;(interactive)
;          (select-frame frame)
;          ; (split-window-horizontally 80)
;          (split-window-right)
;          (other-window 1)
;          ;(split-window-horizontally 80)
;          ;(other-window 1)
;          (split-window)
;          (other-window 1)
;          (if (get-buffer "*terminal<1>*")
;              (switch-to-buffer "*terminal<1>*")
;            (multi-term))
;          (other-window -2)
;          ; This gets problematic if multiple frames are being used at once.
;          (setq grb-temporary-window (nth 1 (window-list)))
;          (setq special-display-function #'grb-special-display)))

;; GRB: open temporary buffers in a dedicated window split
; (setq special-display-regexps
;         '("^\\*Completions\\*$"
;           "^\\*Help\\*$"
;           "^\\*grep\\*$"
;           "^\\*Apropos\\*$"
;           "^\\*elisp macroexpansion\\*$"
;           "^\\*local variables\\*$"
;           "^\\*Compile-Log\\*$"
;           "^\\*Quail Completions\\*$"
;           "^\\*Occur\\*$"
;           "^\\*frequencies\\*$"
;           "^\\*compilation\\*$"
;           "^\\*Locate\\*$"
;           "^\\*Colors\\*$"
;           "^\\*tumme-display-image\\*$"
;           "^\\*SLIME Description\\*$"
;           "^\\*.* output\\*$"           ; tex compilation buffer
;           "^\\*TeX Help\\*$"
;           "^\\*Shell Command Output\\*$"
;           "^\\*Async Shell Command\\*$"
;           "^\\*Backtrace\\*$"))
; (defun grb-special-display (buffer &optional data)
;   (let ((window grb-temporary-window))
;     (with-selected-window window
;       (switch-to-buffer buffer)
;       window)))
; (setq special-display-function #'grb-special-display)

;; Use winner-mode to switch between window configurations
(winner-mode 1)

;; fix PATH
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
