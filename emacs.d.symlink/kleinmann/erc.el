;; -*- coding: utf-8 -*-
(require 'erc)
(setq erc-prompt ">"
      max-buffer-size 100000
      erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK")
      erc-hide-list 'erc-track-exclude-types
      erc-nick '("uwe")
      erc-auto-query 'buffer
      erc-fill-function 'erc-fill-static
      erc-timestamp-format "[%H:%M:%S] ")
(setq erc-modules (quote (button irccontrols scrolltobottom services spelling match completion fill ring stamp track)))
(setq erc-keywords '("asuka" "uwe"))

(add-hook 'erc-connect-pre-hook (lambda (x) (erc-update-modules)))
(add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
(set-face-foreground 'erc-input-face "dim gray")
(set-face-foreground 'erc-my-nick-face "blue")

(add-hook 'erc-join-hook 'bitlbee-identify)
(defun bitlbee-identify ()
  "If we're on the bitlbee server, send the identify command to the
 &bitlbee channel."
  (when (and (string= private/bitlbee-host erc-session-server)
             (string= "&bitlbee" (buffer-name)))
    (erc-message "PRIVMSG" (format "%s identify %s"
                                   (erc-default-target)
                                   private/bitlbee))))


(defun kleinmann-erc ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server private/bitlbee-host :port 6667 :nick "uwe")
))
