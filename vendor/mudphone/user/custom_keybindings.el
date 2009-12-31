;; Mac Settings for GNU Emacs
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Slime
(define-key global-map [(control z)] 'slime-eval-buffer)

;; Toggle truncating lines
(define-key global-map [(control \;)(m)(t)] 'toggle-truncate-lines)

;; Invoke M-x without the Alt Key (Effective Emacs, Item 2)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)