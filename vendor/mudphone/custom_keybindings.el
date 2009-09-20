;; Mac Settings for GNU Emacs
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Slime
(define-key global-map [(control z)] 'slime-eval-buffer)

;; Toggle truncating lines
(define-key global-map [(control \;)(m)(t)] 'toggle-truncate-lines)

