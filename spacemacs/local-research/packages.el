(defconst local-research-packages
  '(
    parsebib
    helm-bibtex
    org-ref
    ))

(defvar local-research-excluded-packages '())

(defun local-research/init-parsebib ()
  (use-package parsebib
    :defer t))

(defun local-research/post-init-helm-bibtex ()
  (spacemacs/set-leader-keys "or" 'helm-bibtex)
  (setq bibtex-completion-bibliography "~/Dropbox/Papers/bibliography.bib")
  (setq helm-bibtex-library-path "~/Dropbox/Papers/pdf")
  (setq helm-bibtex-notes-path "~/Dropbox/Papers/notes")
  (setq helm-bibtex-notes-extension ".org")
  (setq helm-bibtex-pdf-open-function
        (lambda (fpath)
          (start-process "Preview" "*preview*" "open" fpath)))

  (setq helm-bibtex-additional-search-fields '(keywords journal tags)))

(defun local-research/post-init-org-ref ()
  (use-package org-ref
    :defer t
    :config

    (require 'org-ref-bibtex)
    (setq org-ref-bibliography-notes "~/Dropbox/Papers/notes/notes.org")
    (setq org-ref-default-bibliography '("~/Dropbox/Papers/bibliography.bib"))
    (setq org-ref-pdf-directory "~/Dropbox/Papers/pdf/")
    (setq reftex-default-bibliography '("~/Dropbox/Papers/bibliography.bib"))

    (defun org-ref-include-default-bibliography (backend)
      "Add bibliographystyle and bibliography links on export if they are needed."
      (cond
       ((eq backend 'latex)
        (let* ((links (org-element-map (org-element-parse-buffer) 'link #'identity))
               (cites (-filter (lambda (link)
                                 (member (org-element-property :type link) org-ref-cite-types))
                               links))
               (style (-filter (lambda (link)
                                 (string= (org-element-property :type link) "bibliographystyle"))
                               links))
               (bibliography (-filter (lambda (link)
                                        (string= (org-element-property :type link) "bibliography"))
                                      links)))
          (when cites
            (unless style
              (goto-char (point-max))
              (insert "\nbibliographystyle:unsrt"))
            (unless bibliography
              (goto-char (point-max))
              (insert (format
                       "\nbibliography:%s"
                       (mapconcat (lambda (x)
                                    (file-relative-name x (file-name-directory (buffer-file-name))))
                                  org-ref-default-bibliography ",")))))))))

    (add-hook 'org-export-before-processing-hook #'org-ref-include-default-bibliography)))
