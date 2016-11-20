(setq local-org-packages
      '(
        ;; package names go here
        (jot-mode :location local)
        org
        org-ac
        ox-latex
        ox-tufte
        )
      )

(setq local-org-excluded-packages '())

(defun local-org/init-jot-mode ())

(defun local-org/init-ox-tufte ()
  (require 'ox-tufte))

(defun local-org/init-ox-latex ()
  (require 'ox-latex))

(defun local-org/init-org-ac ()
  (use-package org-ac)
  (org-ac/config-default))

(defun local-org/post-init-ox-latex ()
  (add-to-list 'org-latex-packages-alist '("" "minted" nil))
  ;; remove "inputenc" from default packages as it clashes with xelatex
  (setf org-latex-default-packages-alist
        (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))
  ;; use package caption instead of capt-of which clashes with minted
  (setf org-latex-default-packages-alist
        (remove '("" "capt-of" t) org-latex-default-packages-alist))
  (add-to-list 'org-latex-default-packages-alist
               `("", "caption" nil) t)
  ;; Set a nicer default style for the hyperref package
  (setf org-latex-default-packages-alist
        (remove '("" "hyperref" nil) org-latex-default-packages-alist))
  (add-to-list 'org-latex-default-packages-alist
               `("colorlinks=true, linkcolor=teal, urlcolor=teal, citecolor=darkgray, anchorcolor=teal", "hyperref" nil))
  ;; add fontspec package for utf8 characters with xelatex
  (add-to-list 'org-latex-default-packages-alist
               `("", "fontspec" nil) t)
  (setq org-latex-listings 'minted
        org-latex-minted-options '(("frame" "lines")
                                   ("frontsize" "\\scriptsize")
                                   ("linenos" ""))
        org-latex-table-caption-above nil
        org-html-table-caption-above nil)
  ;; setup of latex processing
  (setq org-latex-pdf-process '("latexmk %f"))
  (add-to-list 'org-latex-classes
               '("article"
                 "\\documentclass{article}
                  \\usepackage{geometry}
                 \\geometry{a4paper, textwidth=6.5in, textheight=10in, marginparsep=7pt, marginparwidth=.6in}
                 \\usepackage{tabulary}
                 \\usepackage{minted}
                 \\usepackage{natbib}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

  (defun local-org/post-init-org ()
    (setq-default
     org-return-follows-link t
     org-fontify-whole-heading-line t
     org-tags-column -80
     org-export-coding-system 'utf-8
     org-footnote-define-inline t
     org-log-into-drawer t
     org-catch-invisible-edits 'smart
     org-src-strip-leading-and-trailing-blank-lines t
     org-startup-indented t
     org-src-window-setup 'current-window
     org-startup-align-all-tables t
     org-export-babel-evaluate nil
     org-footnote-auto-adjust t
     org-startup-with-inline-images t
     org-footnote-auto-label 'confirm
     org-confirm-babel-evaluate nil
     org-directory "~/Dropbox/org-mode"
     org-default-notes-file "~/Dropbox/org-mode/capture.org"
     org-agenda-files '("~/Dropbox/org-mode/agenda.org" "~/Dropbox/org-mode/capture.org")
     org-catch-invisible-edits 'show-and-error
     ;; any headline with level <= 2 is a target
     org-refile-targets '((nil :maxlevel . 2)
                                        ; all top-level headlines in the
                                        ; current buffer are used (first) as a
                                        ; refile target
                          (org-agenda-files :maxlevel . 2))
     org-list-allow-alphabetical t
     org-todo-keywords
     '((sequence "TODO(t)" "|" "DONE(D)")
       (type "SIMPLE(s)" "WAITING (w)"
             "|" "CLOSED(C)"))
     org-todo-keyword-faces
     '(("SIMPLE" . "khaki2")
       ("WAITING" . "deepskyblue1"))
     org-capture-templates
     '(("t" "Todo" entry (file+headline "~/Dropbox/org-mode/capture.org" "Tasks")
        "* TODO %?\n%i\n%U"
        :empty-lines 1)
       ("n" "Note" entry (file+headline "~/Dropbox/org-mode/capture.org" "Notes")
        "* %? :NOTE:\n%i\n%U"
        :empty-lines 1))
     org-modules (quote (org-bibtex
                         org-crypt
                         org-id
                         org-info)))

    (org-babel-do-load-languages
     'org-babel-load-languages '((C . t)
                                 (dot . t)
                                 (emacs-lisp . t)
                                 (latex . t)
                                 (php . t)
                                 (python . t)
                                 (ruby . t)
                                 (sh . t)
                                 (shell . t)))

    ;; ensure this variable is defined
    (unless (boundp 'org-babel-default-header-args:sh)
      (setq org-babel-default-header-args:sh '()))

    ;; add a default shebang header argument shell scripts
    (add-to-list 'org-babel-default-header-args:sh
                 '(:shebang . "#!/usr/bin/env bash"))

    ;; add a default shebang header argument for python
    (add-to-list 'org-babel-default-header-args:python
                 '(:shebang . "#!/usr/bin/env python"))

    ;; add a default shebang header argument for ruby
    (add-to-list 'org-babel-default-header-args:ruby
                 '(:shebang . "#!/usr/bin/env ruby"))

    (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
    )
  ;; For each package, define a function local-org/init-<package-name>
  ;;
  ;; (defun local-org/init-my-package ()
  ;;   "Initialize my package"
  ;;   )
  ;;
  ;; Often the body of an initialize function uses `use-package'
  ;; For more info on `use-package', see readme:
  ;; https://github.com/jwiegley/use-package
