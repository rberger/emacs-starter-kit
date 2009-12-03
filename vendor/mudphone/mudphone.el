;; Add to load-path:
(add-to-list 'load-path (concat *VENDOR-ROOT* "/mudphone"))

;; Maxframe - Maximizes the Emacs frame on start.
(load (concat *VENDOR-ROOT* "/mudphone/maxframe.el"))
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; Yet Another Snippet Plugin (yasnippet):
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; Add Mudphone Ruby/Rails settings (Do this after YASnippet):
(load (concat *VENDOR-ROOT* "/mudphone/mudphone_ruby.el"))

;; Javascript
;; (load "~/.emacs.d/vendor/mudphone/javascript.el")
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;; (autoload 'javascript-mode "javascript" nil t)
(load (concat *VENDOR-ROOT* "/mudphone/mudphone_javascript.el"))

;; Magit
(load (concat *VENDOR-ROOT* "/magit/magit.el"))
(require 'magit)

;; Windmove - Allows <shift>-<arrow key> window changing.
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Conditional by Emacs Version
(if (>= emacs-major-version 23)
    (progn
      (scroll-bar-mode)
      (setq tramp-default-method "ssh"))
  (defun x-cut-buffer-or-selection-value ()))

;; Textmate minor mode
(add-to-list 'load-path (concat *VENDOR-ROOT* "/textmate.el"))
(require 'textmate)
(textmate-mode)

;; Paredit
;; enable paredit in slime repl
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; IRC
(require 'erc)
(if (file-readable-p "~/.emacs.d/.erc-auth")
    (load (concat *VENDOR-ROOT* "/mudphone/ercrc.el")))

;; EShell
(load (concat *VENDOR-ROOT* "/mudphone/eshell-customizations.el"))

;; Show Parens
(show-paren-mode)

;; Custom Keybindings
(load (concat *VENDOR-ROOT* "/mudphone/custom_keybindings.el"))
