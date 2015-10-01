;;; keybindings.el --- local-configuration Layer config File for Spacemacs
;;
;; Author: Uwe Kleinmann <uwe@kleinmann.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(evil-leader/set-key "ct" 'kleinmann-build-ctags)
(define-key evil-normal-state-map "t" 'evil-jump-to-tag)
(global-set-key (kbd "<tab>") 'hippie-expand)
(evil-leader/set-key "#" 'evilnc-comment-or-uncomment-lines)
