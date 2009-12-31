;; Growl support
;; Requires growlnotify, source for which is included in the Growl disk image
;; Note that the growlnotify --image option is not reliable on OSX 10.5
;; see http://forums.cocoaforge.com/viewtopic.php?f=6&t=17526&p=114069

;; Wrapper for growlnotify
(defun growl-chat (title message &optional sticky)
  (interactive "sTitle: \nsGrowl: ")
  (shell-command 
   (format "/usr/local/bin/growlnotify %s -m '%s' --appIcon 'Emacs' %s" title message (if sticky "--sticky" ""))))

;; Sticky notifications
(defun growl-chat-sticky (title message)
  (interactive "sTitle: \nsGrowl: ")
  (growl-chat title message nil))

;; ERC notifications
;; Growl nicknames and highlight words when they are mentioned in IRC.
;; Nickname notifications are sticky
(add-hook 'erc-text-matched-hook
          (lambda (match-type nickuserhost message)
            (when (and 
                   (boundp 'nick)
                   (not (string= nick "ChanServ"))
                   (not (string= nick "services."))) 
              (cond
               ((eq match-type 'current-nick)
                (growl-chat-sticky (format "%s said %s" nick (erc-current-nick)) message))
               ((eq match-type 'keyword)
                (growl-chat (format "%s mentioned a Keyword" nick) message))))))