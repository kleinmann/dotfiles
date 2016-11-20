;;; see https://github.com/dakrone/dotfiles/blob/3bd4dac/.spacemacs-config/config-layers/typing-games/packages.el
(defvar typing-games-packages
  '(
    speed-type
    ))

(defvar typing-games-excluded-packages '())

(defun typing-games/init-speed-type ()
  (use-package speed-type
    :defer t)
  )
