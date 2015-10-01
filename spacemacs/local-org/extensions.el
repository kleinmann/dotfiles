;;; extensions.el --- local-org Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

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
