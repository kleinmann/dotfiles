;; -*- coding: utf-8 -*-
;; elpa
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(defvar my-packages
  '(
    ack-and-a-half
    coffee-mode
    css-mode
    flymake
    flymake-php
    flymake-ruby
    gist
    inf-ruby
    haskell-mode
    js2-mode
    json
    magit
    magit-simple-keys
    magithub
    markdown-mode
    nav
    paredit
    php-mode
    pretty-lambdada
    rinari
    ruby-compilation
    ruby-electric
    ruby-mode
    rvm
    scratch
    solarized-theme
    textmate
    undo-tree
    volatile-highlights
    yaml-mode
    yasnippet
    zenburn-theme
    )
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))


;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (with-current-buffer
    (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer) (eval-print-last-sexp)
  )
)

(setq my-el-get-packages '(
                           emacs-w3m
                           nxhtml
                          ))
(el-get 'sync my-el-get-packages)
