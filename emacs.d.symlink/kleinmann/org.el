;; -*- coding: utf-8 -*-
(define-key mode-specific-map [?a] 'org-agenda)

(eval-after-load "org-agenda"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))

     (define-key org-agenda-mode-map "\C-n" 'next-line)
     (define-key org-agenda-keymap "\C-n" 'next-line)
     (define-key org-agenda-mode-map "\C-p" 'previous-line)
     (define-key org-agenda-keymap "\C-p" 'previous-line)

     (add-to-list 'org-modules 'org-habit)

     (setq org-todo-keywords
           '((sequence "TODO(t)" "STARTED(s@/!)" "WAITING(w@/!)" "DELEGATED(e@/!)" "APPT(@!)" "|" "DONE(d@/!)" "DEFERRED" "CANCELLED(c@/)")))
           ))

(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

(setq org-agenda-files (quote ("~/notes/todo.org"))
      org-default-notes-file "~/notes/notes.org"
      org-agenda-ndays 7
      org-agenda-deadline-warning-days 14
      org-agenda-show-all-dates t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-start-on-weekday nil
      org-reverse-note-order t
      org-agenda-window-setup (quote current-window)
      org-directory "~/notes/"
      org-mobile-directory "~/Dropbox/MobileOrg"
      org-mobile-inbox-for-pull "~/notes/todo.org"
      org-fast-tag-selection-single-key (quote expert)
      org-remember-store-without-prompt t
      org-completion-use-ido t
      org-log-into-drawer t
      org-clock-into-drawer "CLOCK"
      org-agenda-start-with-clockreport-mode t
      org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 4))
      org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM"
      org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 8:00")))
      remember-annotation-functions (quote (org-remember-annotation))
      remember-handler-functions (quote (org-remember-handler))
      org-remember-templates (quote (
                                     ("Task" ?t "* TODO %?\n  %U" "~/notes/todo.org" "Tasks")
                                     ("Note" ?n "* %U %?" "~/notes/notes.org" "Notes")
                                     ("Reading" ?r "* %^{Title} %T%?" "~/notes/reading.org" "Inbox")
                                     ("Movie" ?m "* %^{Title} %T%?" "~/notes/movies.org" "Inbox")
                                     ("Appointment" ?a "* APPT %?\n" "~/notes/todo.org" "Tasks")
                                     ("Birthday" ?b "\%\%\(diary-anniversary %^{Month} %^{Day} %^{Year}\) Names \%d. Geburtstag" "~/notes/todo.org" "Anniversaries and Holidays")
                                     ("Habit" ?h "* TODO %?\n  %U\nSCHEDULED: %^{Schedule}t\n## Use .+2d/4d in Schedule to do it at most every 2 days, but at least every 4 days\n:PROPERTIES:\n:STYLE: habit\n:END:")))
      org-agenda-custom-commands (quote (
                                         ("d" todo "DELEGATED" nil)
                                         ("c" todo "DONE|DEFERRED|CANCELLED" nil)
                                         ("w" todo-add-category "WAITING" nil)
                                         ("W" agenda "" ((org-agenda-ndays 21)))
                                         ("A" agenda ""
                                                        ((org-agenda-skip-function
                                                          (lambda nil
                                                            (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
                                                         (org-agenda-ndays 1)
                                                         (org-agenda-overriding-header "Today's Priority #A tasks: ")))
                                         ("u" alltodo ""
                                                        ((org-agenda-skip-function
                                                          (lambda nil
                                                            (org-agenda-skip-entry-if
                                                             (quote scheduled)
                                                             (quote deadline)
                                                             (quote regexp) "\n]+>")))
                                                         (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
