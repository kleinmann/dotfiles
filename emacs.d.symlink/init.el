;; emacs configuration

(push "/usr/local/bin" exec-path)

;; default xemacs configuration directory
  (defconst toc:emacs-config-dir "~/.emacs.d/config/" "")
  ;; utility finction to auto-load my package configurations
  (defun toc:load-config-file (filelist)
    (dolist (file filelist)
      (load (expand-file-name 
             (concat toc:emacs-config-dir file)))
       (message "Loaded config file:%s" file)
       ))
  ;; load my configuration files
  (toc:load-config-file '("basics"
                          "theme"
                          "plugins"
                         ))
