;; -*- coding: utf-8 -*-
(define-project-type ruby (generic) (look-for "Gemfile"))

;; use ido
(setq eproject-completing-read-function 'eproject--ido-completing-read)
