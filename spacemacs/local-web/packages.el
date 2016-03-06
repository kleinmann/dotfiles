;;; packages.el --- local-web layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Uwe Kleinmann <uwe@kleinmann.org>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `local-web-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `local-web/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `local-web/pre-init-PACKAGE' and/or
;;   `local-web/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq local-web-packages
  '(
    skewer-mode
    less-css-mode
    skewer-less
    ))

(defun local-web/init-skewer-mode ()
  "Initialize skewer-mode"
  (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode)
  )

(defun local-web/init-less-css-mode ()
  "Initialize skewer-less"
  )

(defun local-web/init-skewer-less ()
  "Initialize skewer-less"
  (add-hook 'less-mode-hook 'skewer-less-mode)
  )

;;; packages.el ends here
