;; For Rails / Ruby

;; Interactively Do Things (highly recommended, but not strictly required)
;;;;; ido stuff
(setq ido-confirm-unique-completion t)
(setq ido-default-buffer-method 'samewindow)
(setq ido-use-filename-at-point t)
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(set-face-background 'ido-first-match "white")
(set-face-foreground 'ido-subdir "blue3")

;; Rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)

;; nxml (HTML ERB template support)
;(load "~/.emacs.d/vendor/nxhtml/autostart.el")
;(setq
;  nxhtml-global-minor-mode t
;  mumamo-chunk-coloring 'submode-colored
;  nxhtml-skip-welcome t
;  indent-region-mode t
;  rng-nxml-auto-validate-flag nil
;  nxml-degraded t)
;(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))

;; RSpec
(load "~/.emacs.d/vendor/rspec-mode/linkify.el")
(load "~/.emacs.d/vendor/rspec-mode/rspec-mode.el")
