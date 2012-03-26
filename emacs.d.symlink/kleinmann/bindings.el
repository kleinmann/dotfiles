;; -*- coding: utf-8 -*-
(global-set-key (kbd "C-M-k") 'ack-and-a-half)
(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "C-S-r") 'remember)
; I have mapped Command to Meta, but I still want to be able to quit with Command+q
(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-c g") 'magit-status)
