;;; lang/custom-php/config.el -*- lexical-binding: t; -*-

(use-package! transient
  :after php-mode
  :hook
  ((php-mode . uk/phpactor)))

(use-package! smart-jump
  :after php-mode
  :config
  (smart-jump-setup-default-registers)
  :hook
   ((php-mode . uk/smart-jump-php))
  :general
  (:keymaps 'php-mode-map :states 'normal
   "," 'php-transient-menu)
  (:keymaps 'php-mode-map :states '(insert normal)
   "M-." 'smart-jump-go
   "M--" 'smart-jump-references)
  )

(defun uk/smart-jump-php ()
  "Registers smartjump function for php."
  (smart-jump-register :modes '(php-mode phps-mode)
                       :jump-fn 'phpactor-goto-definition
                       :refs-fn 'phpactor-find-references
                       :should-jump t
                       :heuristic 'point
                       :async t)
  )

(defun uk/phpactor ()
  "Sets up phpactor"
  (make-local-variable 'eldoc-documentation-function)
  (setq eldoc-documentation-function
        'phpactor-hover)
  (transient-define-prefix php-transient-menu ()
    "Php"
    [["Class"
      ("cc" "Copy" phpactor-copy-class)
      ("cn" "New" phpactor-create-new-class)
      ("cr" "Move" phpactor-move-class)
      ("ci" "Inflect" phpactor-inflect-class)
      ("n"  "Namespace" phpactor-fix-namespace)]
     ["Properties"
      ("a"  "Accessor" phpactor-generate-accessors)
      ("pc" "Constructor" phpactor-complete-constructor)
      ("pm" "Add missing props" phpactor-complete-properties)
      ("r" "Rename var locally" phpactor-rename-variable-local)
      ("R" "Rename var in file" phpactor-rename-variable-file)]
     ["Extract"
      ("ec" "constant" phpactor-extract-constant)
      ("ee" "expression" phpactor-extract-expression)
      ("em"  "method" phpactor-extract-method)]
     ["Methods"
      ("i" "Implement Contracts" phpactor-implement-contracts)
      ("m"  "Generate method" phpactor-generate-method)]
     ["Navigate"
      ("x" "List refs" phpactor-list-references)
      ("X" "Replace refs" phpactor-replace-references)
      ("."  "Goto def" phpactor-goto-definition)]
     ["Phpactor"
      ("s" "Status" phpactor-status)
      ("u" "Install" phpactor-install-or-update)]])
  )
