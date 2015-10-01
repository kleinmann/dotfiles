;;; extensions.el --- local-configuration Layer extensions File for Spacemacs
;;
;; Author: Uwe Kleinmann <uwe@kleinmann.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq local-configuration-pre-extensions
  '(
    ;; pre extension local-configurations go here
    )
  )

(setq local-configuration-post-extensions
  '(
    ;; post extension local-configurations go here
    )
  )

;; For each extension, define a function local-configuration/init-<extension-local-configuration>
;;
;; (defun local-configuration/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
