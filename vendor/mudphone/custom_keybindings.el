;; Mac Settings for GNU Emacs
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Toggle truncating lines
(define-key global-map [(control \;)(m)(t)] 'toggle-truncate-lines)

