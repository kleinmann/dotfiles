(setq local-configuration-packages
      '(
        ;; package local-configurations go here
        evil
        evil-unimpaired
        hippie-exp
        sx
        )
      )

(setq local-configuration-excluded-packages '())

(defun local-configuration/init-sx ())

(defun local-configuration/post-init-evil ()
  (kleinmann/define-key evil-normal-state-map
                        "t" 'evil-jump-to-tag
                        "+" 'spacemacs/evil-numbers-transient-state/evil-numbers/inc-at-pt
                        "_" 'spacemacs/evil-numbers-transient-state/evil-numbers/dec-at-pt)
  (kleinmann/define-key evil-insert-state-map
                        (kbd "C-e") 'move-end-of-line
                        (kbd "C-a") 'back-to-indentation)
  (spacemacs/set-leader-keys
    "#" 'evilnc-comment-or-uncomment-lines
    "oe" 'evil-edit))

(defun local-configuration/post-init-evil-unimpaired ())

(defun local-configuration/post-init-hippie-exp ()
  (kleinmann/define-key evil-insert-state-map
                 (kbd "C-SPC") 'hippie-expand))
;; For each package, define a function local-configuration/init-<package-local-configuration>
;;
;; (defun local-configuration/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
