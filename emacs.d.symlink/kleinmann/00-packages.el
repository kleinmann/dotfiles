;; -*- coding: utf-8 -*-
;; elpa
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar my-packages
  '(
    ack-and-a-half
    auctex
    clojure-mode
    coffee-mode
    css-mode
    dired+
    expand-region
    feature-mode
    flymake
    flymake-php
    flymake-ruby
    inf-ruby
    haml-mode
    haskell-mode
    helm
    helm-projectile
    js2-mode
    json
    magit
    magithub
    markdown-mode
    paredit
    php-mode
    pretty-lambdada
    projectile
    python
    rainbow-mode
    rinari
    ruby-compilation
    ruby-mode
    rvm
    sass-mode
    scss-mode
    scratch
    slime-repl
    smex
    solarized-theme
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

(setq el-get-sources
      '(
        (:name eproject
               :type git :url "http://github.com/jrockway/eproject.git"
               :features (eproject eproject-extras))))
(setq my-el-get-packages '(
                           calfw
                           eproject
                           nxhtml
                           ))
(el-get 'sync my-el-get-packages)
