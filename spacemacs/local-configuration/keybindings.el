(evil-leader/set-key "ct" 'kleinmann-build-ctags)
(define-key evil-normal-state-map "t" 'evil-jump-to-tag)
(global-set-key (kbd "<tab>") 'hippie-expand)
(evil-leader/set-key "#" 'evilnc-comment-or-uncomment-lines)
