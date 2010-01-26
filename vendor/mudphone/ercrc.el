(load "~/.emacs.d/.erc-auth")
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      freenode-channels-alist)

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                 "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;; setup shortcut
(defun erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?
    (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net"
           :port 6667
           :nick freenode-nick
           :full-name freenode-full-name
           :password freenode-pass)
      (bitlbee-start)
      (run-at-time "1 sec" nil 'erc
                   :server "localhost"
                   :port 6667
                   :nick freenode-nick
                   :full-name freenode-full-name
                   :password freenode-pass))))
(global-set-key (kbd "C-c i") 'erc-start-or-switch) ;; ERC
