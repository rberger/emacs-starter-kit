;; Add to load-path:
(add-to-list 'load-path "~/.emacs.d/vendor/mudphone")

;; Yet Another Snippet Plugin (yasnippet):
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; Add Mudphone Ruby/Rails settings (Do this after YASnippet):
(load "~/.emacs.d/vendor/mudphone/mudphone_ruby.el")

;; Javascript
;; (load "~/.emacs.d/vendor/mudphone/javascript.el")
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;; (autoload 'javascript-mode "javascript" nil t)
(load "~/.emacs.d/vendor/mudphone/mudphone_javascript.el")

;; Magit
(load "~/.emacs.d/vendor/magit/magit.el")
(require 'magit)

;; Maxframe - Maximizes the Emacs frame on start.
(load "~/.emacs.d/vendor/mudphone/maxframe.el")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; Windmove - Allows <shift>-<arrow key> window changing.
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Textmate minor mode
;; (add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)

;; Custom Keybindings
(load "~/.emacs.d/vendor/mudphone/custom_keybindings.el")

;; Runa Settings
(load "~/.emacs.d/vendor/mudphone/runa.el")