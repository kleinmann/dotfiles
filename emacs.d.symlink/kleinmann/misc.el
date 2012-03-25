;; -*- coding: utf-8 -*-
;; activate undo-tree
(global-undo-tree-mode)

;; activate yasnippets
(require 'yasnippet)
(yas/global-mode)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)
