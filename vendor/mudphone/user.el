;;----------------------------------------
;; load path settings
;;----------------------------------------
(setq *USER-ROOT* (getenv "HOME"))
(setq *WORK-ROOT* (concat *USER-ROOT* "/work"))
(setq *VENDOR-ROOT* (concat *USER-ROOT* "/.emacs.d/vendor"))

;;----------------------------------------
;; customizations
;;----------------------------------------
;; - comment line out if not required
(setq *EXTRA-SWANK-CLASSPATH-FILE-PATH* (concat *VENDOR-ROOT* "/mudphone/extra_classpaths.el"))
(setq *SWANK-CLOJURE-JAR-PATH* (concat *WORK-ROOT* "/runa/furtive/lib/java/clojure.jar"))
(setq *CUSTOM-SETTINGS-PATH* (concat *VENDOR-ROOT* "/mudphone/mudphone.el"))

;;----------------------------------------
;; clojure-mode
;;----------------------------------------
;; (add-to-list 'load-path (concat *VENDOR-ROOT* "/clojure-mode"))
;; (require 'clojure-mode)

;;----------------------------------------
;; swank-clojure
;;----------------------------------------
;; basic swank classpath setup
(setq *DOT-CLOJURE-PATH* "~/.clojure")
(if (file-accessible-directory-p *DOT-CLOJURE-PATH*)
    (setq extra-classpaths (directory-files *DOT-CLOJURE-PATH* t "\\.jar$"))
  (setq extra-classpaths '()))
(defun add-to-extra-classpath (entry)
  (add-to-list 'extra-classpaths entry))

;; load runa classes for swank
(load (concat *VENDOR-ROOT* "/runa/runa.el"))
;; load personal classes for swank
(if (boundp '*EXTRA-SWANK-CLASSPATH-FILE-PATH*)
    (load *EXTRA-SWANK-CLASSPATH-FILE-PATH*))

;; swank-clojure --
;; KEEP THIS until you properly configure Swank-Clojure ... :{
(add-to-list 'load-path (concat *VENDOR-ROOT* "/swank-clojure"))
(require 'swank-clojure-autoload)
(swank-clojure-config
 (if (boundp '*SWANK-CLOJURE-JAR-PATH*)
     (setq swank-clojure-jar-path *SWANK-CLOJURE-JAR-PATH*))
 (setq swank-clojure-extra-classpaths extra-classpaths))


;;----------------------------------------
;; slime
;;----------------------------------------
;;(eval-after-load "slime"
;;  '(progn (slime-setup '(slime-repl))))
;;(add-to-list 'load-path (concat *VENDOR-ROOT* "/slime"))
;;(require 'slime)
;;(slime-setup)

;;----------------------------------------
;; other
;;----------------------------------------

;; start emacs server (for use with emacsclient):
(server-start)

;; add runa extras:
(load (concat *VENDOR-ROOT* "/runa/runa_extras.el"))

;; add your custom settings:
(if (boundp '*CUSTOM-SETTINGS-PATH*)
    (load *CUSTOM-SETTINGS-PATH*))

;; This is all probably only used by Carbon.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ido-mode (quote both) nil (ido))
 '(blink-cursor-mode t)
 '(debug-on-error t)
 '(indent-tabs-mode nil)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-width 2)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
