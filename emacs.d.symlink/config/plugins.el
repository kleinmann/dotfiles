(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))


(when (not package-archive-contents) (package-refresh-contents))

(defvar my-packages '(
                      auto-complete
                      marmalade
                      starter-kit
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-ruby
                      ))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(setq el-get-sources
      '((:name ruby-mode 
               :type elpa
               :load "ruby-mode.el"
               :after (lambda ()
                        (toc:load-config-file '("modes/ruby"))
                        (ruby-mode-hook)
                      )
        )
        (:name inf-ruby  :type elpa)
        (:name ruby-compilation :type elpa)
        (:name css-mode 
               :type elpa 
               :after (lambda ()
                        (toc:load-config-file '("modes/css"))
                        (css-mode-hook)
                      )
        )
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda ()
                        (rvm-use-default)
                      )
        )
        (:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml.git"
               :features rhtml-mode
               :after (lambda ()
                        (toc:load-config-file '("modes/rhtml"))
                        (rhtml-mode-hook)
                      )
        )
        (:name yaml-mode 
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda ()
                        (toc:load-config-file '("modes/yaml"))
                        (yaml-mode-hook)
                      )
        )))
(el-get 'sync)
