(setq local-org-pre-extensions
      '(
        ;; pre extension local-orgs go here
        )
      )

(setq local-org-post-extensions
  '(
    ;; post extension local-orgs go here
    jot-mode
    )
  )

;; For each extension, define a function local-org/init-<extension-local-org>
;;
(defun local-org/init-jot-mode ()
    (use-package jot-mode)
  "Initialize my extension")
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
