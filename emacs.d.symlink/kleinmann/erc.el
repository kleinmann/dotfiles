;; -*- coding: utf-8 -*-
(require 'erc)
(setq erc-prompt ">"
      max-buffer-size 100000
      erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK")
      erc-hide-list 'erc-track-exclude-types
      erc-nick '("asuka" "asuka_")
      erc-auto-query 'buffer
      erc-fill-function 'erc-fill-static
      erc-timestamp-format "[%H:%M:%S] ")
(setq erc-modules (quote (button irccontrols scrolltobottom services spelling match completion fill ring stamp track)))
(setq erc-keywords '("asuka" "uwe"))

(add-hook 'erc-connect-pre-hook (lambda (x) (erc-update-modules)))
(add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
(set-face-foreground 'erc-input-face "dim gray")
(set-face-foreground 'erc-my-nick-face "blue")

(defun erc-start ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "home.hadiko.de:6667") ;; ERC already active?

    (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      ;; I use ZNC so I need to hit my server
      (erc :server "home.hadiko.de" :port 55430 :nick "asuka" :password private/irssi)
      (erc :server "home.hadiko.de" :port 55431 :nick "asuka_" :password private/irssi)
      (erc :server "home.hadiko.de" :port 55432 :nick "asuka" :password private/irssi)
)))
