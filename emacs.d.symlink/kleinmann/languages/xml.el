;; -*- coding: utf-8 -*-
;; Files
(add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))


;; Hooks


;; Indentation
(setq nxml-child-indent 4)
(setq nxml-attribute-indent 4)


;; Minor modes


;; Misc
(setq nxml-auto-insert-xml-declaration-flag nil)
(setq nxml-bind-meta-tab-to-complete-flag t)
(setq nxml-slash-auto-complete-flag t)
