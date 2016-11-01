(setq local-configuration-packages
      '(
        ;; package local-configurations go here
        editorconfig
        aggressive-indent-mode
        )
      )

(setq local-configuration-excluded-packages '())

(defun local-configuration/init-editorconfig ()
  "Initialize editorconfig"
  )
(defun local-configuration/init-aggressive-indent-mode ()
  "Initialize editorconfig"
  (global-aggressive-indent-mode 1)
  )
;; For each package, define a function local-configuration/init-<package-local-configuration>
;;
;; (defun local-configuration/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
