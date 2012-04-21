;; -*- coding: utf-8 -*-
(global-set-key (kbd "C-M-k") 'ack-and-a-half)
(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "C-M-r") 'remember)
; I have mapped Command to Meta, but I still want to be able to quit with Command+q
(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
; Same with Command+n for new frame
(global-set-key (kbd "M-n") 'new-frame)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c c") 'kleinmann-calendar)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c h") 'helm-prelude)
(global-set-key (kbd "TAB") 'smart-tab)
(global-set-key (kbd "C-x C-+") 'enlarge-window)
(global-set-key (kbd "C-x C--") 'shrink-window)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c d") 'sr-speedbar-toggle)
(global-set-key (kbd "M-E") 'er/expand-region)

;; Window manipulation
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-k") 'kill-this-buffer)
;; Enable windmove, use shift+arrow to switch windows
(windmove-default-keybindings)
