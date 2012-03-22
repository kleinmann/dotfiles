;; -*- coding: utf-8 -*-
(setq magit-repo-dirs '("~/code" "~/.dotfiles"))
(setq magit-repo-dirs-depth 3)

;; Use Ido for selecting repos.
(setq magit-completing-read 'ido-completing-read)

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))
