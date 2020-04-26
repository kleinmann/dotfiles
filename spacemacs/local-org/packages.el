(defconst local-org-packages
          '((jot-mode :location local)
            org
            org-ac
            ox-tufte
            skeleton
            ))

(defun local-org/init-jot-mode ()
  (use-package jot-mode))

(defun local-org/init-ox-tufte ()
  (use-package ox-tufte
               :ensure t
               :init (require 'ox-tufte))
  (when (boundp 'org-export-backends)
    (customize-set-variable 'org-export-backends
                            (cons 'tufte org-export-backends))))

(defun local-org/init-org-ac ()
  (use-package org-ac)
  (org-ac/config-default))

(defun local-org/post-init-ox-gfm ()
  (when (boundp 'org-export-backends)
    (customize-set-variable 'org-export-backends
                            (cons 'gfm org-export-backends))))

(defun local-org/post-init-org ()
  (setq-default
    org-return-follows-link t
    org-fontify-whole-heading-line t
    org-html-htmlize-output-type 'css
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
                         org-info
                         org-exp-blocks)))

  (org-babel-do-load-languages
    'org-babel-load-languages '((C . t)
                                (dot . t)
                                (emacs-lisp . t)
                                (latex . t)
                                (php . t)
                                (python . t)
                                (ruby . t)
                                (shell . t)))

  (add-to-list 'org-src-lang-modes '("dot" . graphviz-dot-mode))

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
  (setq org-html-head-include-default-style nil)

  (setq org-publish-project-alist
        `(;; Main website at https://codeventure.de
          ("codeventure-org"
           :base-directory ,(file-truename "~/Dropbox/org-mode/codeventure.de/")
           :base-extension "org"
           :publishing-directory "/ssh:codeventure:/var/www/codeventure.de/"
           :publishing-function (org-html-publish-to-tufte-html)
           :recursive t
           :with-toc nil
           :html-preamble t
           :html-head-extra
           "<link rel=\"alternate\" type=\"application/rss+xml\"
           href=\"https://codeventure.de/posts.xml\"
           title=\"RSS feed for codeventure.de\">")
           ("codeventure-rss"
            :base-directory ,(file-truename  "~/Dropbox/org-mode/codeventure.de")
            :base-extension "org"
            :publishing-directory "/ssh:codeventure:/var/www/codeventure.de/"
            :publishing-function org-rss-publish-to-rss
            :html-link-home "https://codeventure.de/"
            :recursive t
            :exclude ".*"
            :include ("posts.org")
            :html-link-use-abs-url t)
           ("codeventure-images"
            :base-directory ,(file-truename  "~/Dropbox/org-mode/codeventure.de/images")
            :base-extension "png\\|jpg\\|gif"
            :publishing-directory "/ssh:codeventure:/var/www/codeventure.de/images"
            :publishing-function org-publish-attachment
            :recursive t)
           ("codeventure-files"
            :base-directory ,(file-truename  "~/Dropbox/org-mode/codeventure.de/files")
            :base-extension "*"
            :publishing-directory "/ssh:codeventure:/var/www/codeventure.de/files/"
            :publishing-function org-publish-attachment
            :recursive t)
           ("codeventure" :components ("codeventure-org"
                                       "codeventure-images"
                                       "codeventure-files"
                                       "codeventure-rss"))

           ;; Org-mode files for ~/.emacs.d/settings.org
           ("dotfiles"
            :base-directory ,(file-truename "~/.dotfiles/")
            :base-extension "org\\|html"
            :publishing-directory
            "/ssh:codeventure:/var/www/codeventure.de/org/"
            :publishing-function org-html-publish-to-html
            :recursive t
            :with-toc t
            :html-preamble t)

           ;; Org-mode files for ~/Dropbox/org-mode files
           ("org-org"
            :base-directory ,(file-truename "~/Dropbox/org-mode/")
            :base-extension "org\\|html"
            :publishing-directory
            "/ssh:codeventure:/var/www/codeventure.de/org/"
            :publishing-function org-html-publish-to-tufte-html
            :with-toc t
            :html-preamble t)
           ("org-images"
            :base-directory ,(file-truename "~/Dropbox/org-mode/images")
            :base-extension "png\\|jpg"
            :publishing-directory
            "/ssh:codeventure:/var/www/codeventure.de/org/images"
            :publishing-function org-publish-attachment)
           ("org" :components ("org-org"
                               "org-images"))
           ("org-studies-org"
            :base-directory ,(file-truename "~/Dropbox/org-mode/studies/")
            :base-extension "org\\|html"
            :publishing-directory
            "/ssh:codeventure:/var/www/codeventure.de/org/studies/"
            :publishing-function org-html-publish-to-tufte-html
            :recursive t
            :with-toc nil
            :html-preamble t)
           ("org-studies" :components ("org-studies-org"))))

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
               `("linktoc=all, pdfstartview=FitH, colorlinks=true, linkcolor=teal, urlcolor=teal, citecolor=darkgray, anchorcolor=teal, filecolor=teal, menucolor=teal", "hyperref" nil))

  ;; add fontspec package for utf8 characters with xelatex
  (add-to-list 'org-latex-default-packages-alist
               `("", "fontspec" nil) t)

  (setq org-latex-listings 'minted
        org-src-preserve-indentation t
        org-latex-minted-options '(("frame" "lines")
                                   ("fontsize" "\\scriptsize")
                                   ("linenos" ""))
        org-latex-packages-alist '(
                                   ("" "minted" nil)
                                   ("hyperref=true, backref=true, maxcitenames=3, url=true, backend=biber, natbib=true" "biblatex" nil)
                                   ("" "tabulary" nil)
                                   ("" "url" nil)
                                   ("" "amsmath" nil)
                                   ("" "pdfpages" nil)
                                   )
        org-latex-table-caption-above nil
        org-html-table-caption-above nil)

  ;; setup of latex processing
  (setq org-latex-pdf-process '("latexmk -pdflatex='xelatex -shell-escape' -f -pdf %f"
                                "latexmk -pdflatex='xelatex -shell-escape' -f -pdf %f"))
  (add-to-list 'org-latex-classes
               '("kleinmann-article"
                 "\\documentclass[a4,11pt]{scrartcl}
                 \\usepackage{geometry}
                 \\geometry{a4paper, textwidth=6.5in, textheight=10in, marginparsep=7pt, marginparwidth=.6in}
[DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
\\setmonofont[Mapping=tex-text,Scale=0.85]{Source Code Pro Light}
\\addbibresource{bibliography.bib}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  )

(defun local-org/init-skeleton ()
  (use-package skeleton
    :ensure t
    :init (require 'skeleton))
  (define-skeleton kleinmann/org-header
    "Insert a standard header for org-mode files"
    "Title: "
    "#+TITLE: " str \n
    "#+AUTHOR: " (user-full-name) \n
    "#+EMAIL: " user-mail-address \n
    "#+SETUPFILE: ~/.dotfiles/spacemacs/local-org/setupfiles/tufte.setup

| *Author* | {{{author}}} ({{{email}}})    |
| *Date*   | {{{time(%Y-%m-%d)}}} |

* Introduction
" \n)

  (define-skeleton kleinmann/org-latex-header
    "Insert a standard LaTeX header for org-mode files"
    "Title: "
    "#+TITLE: " str \n
    "#+AUTHOR: " (user-full-name) \n
    "#+EMAIL: " user-mail-address \n
    "#+SETUPFILE: ~/.dotfiles/spacemacs/local-org/setupfiles/latex.setup

\\newpage
#+BEGIN_abstract
Abstract for this article.
#+END_abstract

\newpage
\tableofcontents

\\thispagestyle{empty}
\\clearpage
\\setcounter{page}{1}
* Introduction

\\newpage
\\printbibliography

* build								   :noexport:

[[elisp:(org-open-file (org-latex-export-to-pdf))]]
" \n)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode
    "ihd" 'kleinmann/org-header)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode
    "ihl" 'kleinmann/org-latex-header))
