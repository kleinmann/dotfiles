;;; jot-mode.el -- Notetaking mode that extends org-mode for Emacs.

;; Copyright (C) 2009 Raffi Rush <raffir@gmail.com>

;; Maintainer: Raffi Rush
;; Version: 0.1
;; Keywords: outlines, lecture notes, jot

;; This file is not part of GNU Emacs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; This file implements some extensions for org-mode to make it
;; more amenable to being used to construct an outline very rapidly
;; (e.g. for lecture notes).

;; Put this file into your load-path and put the following into your ~/.emacs:
;; (require 'jot)

;; Using jot-mode:

;; Jot-mode modifies org-mode to make it more amenable to rapid notetaking.
;; First of all, by default all headings are expanded.
;; Second of all, key remappings:
;; [Return/enter]: creates a new bullet at the same level as the current heading. To edit text under the current heading, use C-j or C-return
;; TAB: demotes the current heading. It can be used anywhere with the current heading. In org-mode, this is done using Meta-[right arrow]
;; Shift-TAB: outdents (promotes the current heading)
;; C-TAB: is the new org-shifttab

;;; Code:
(require 'org)

(define-derived-mode jot-mode
  org-mode "Jot"
  "Major mode for jottable notes. Derived from org-mode."
  )

;; TODO: delete current heading.
(defun jot-kill-current-heading ()
  (interactive)
)


;; TODO: Continue numbers.

;; TODO: Expand to depth of point.

;; Undone:
(defun jot-export-this-file ()
  (interactive)
  (org-export 0))


  

(defun jot-insert-heading ()
  "Insert a heading after current one. "
  (interactive)
  (org-insert-heading-after-current)
  (show-all))

;(defun jot-insert-heading ()
;  (interactive)
;  (move-end-of-line)
;  (org-insert-heading-after-current)
;  (show-all))

;; The all-important keyboard shortcuts
(define-key jot-mode-map (kbd "RET") 'jot-insert-heading)
(define-key jot-mode-map [(tab)]      'org-do-demote)
(define-key jot-mode-map [(shift tab)] 'org-do-promote)
(define-key jot-mode-map [(control tab)] 'org-shifttab)
(define-key jot-mode-map [(control return)] 'org-return-indent)  
(define-key jot-mode-map "\C-c\C-e" 'jot-export-this-file)



;;; Finish up
(provide 'jot-mode)
(provide 'jot)
