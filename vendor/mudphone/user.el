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
(setq *CUSTOM-SETTINGS-PATH* (concat *VENDOR-ROOT* "/mudphone/mudphone.el"))

;;----------------------------------------
;; swank-clojure
;;----------------------------------------
(setq extra-classpaths '())
(defun add-to-extra-classpath (entry)
  "Used by runa/runa.el and mudphone/extra_classpaths.el"
  (add-to-list 'extra-classpaths entry))

;; Add Runa and personal stuff to swank clojure classpath:
(load (concat *VENDOR-ROOT* "/runa/runa.el"))
(if (boundp '*EXTRA-SWANK-CLASSPATH-FILE-PATH*)
    (load *EXTRA-SWANK-CLASSPATH-FILE-PATH*))

;; This wouldn't be necessary if we were using swank-clojure-project
;; properly.  In the meantime, I'm fairly certain that local
;; lib clojure.jar and swank-clojure.jar files are picked up
;; in preference to what's here when suing swank-clojure-project.
(setq swank-clojure-jars '())
(add-to-list 'swank-clojure-jars (concat *WORK-ROOT* "/runa/furtive/lib/java/clojure.jar"))
(add-to-list 'swank-clojure-jars (concat *USER-ROOT* "/.swank-clojure/swank-clojure.jar"))
(setq swank-clojure-classpath (append swank-clojure-jars extra-classpaths))


;; swank-clojure --
;; KEEP THIS until you properly configure Swank-Clojure ... :{
;;;;;; BEGIN
;; (setq *SWANK-CLOJURE-JAR-PATH* (concat *WORK-ROOT* "/runa/furtive/lib/java/clojure.jar"))
;;
;; basic swank classpath setup
;; (setq *DOT-CLOJURE-PATH* "~/.clojure")
;; (if (file-accessible-directory-p *DOT-CLOJURE-PATH*)
;;     (setq extra-classpaths (directory-files *DOT-CLOJURE-PATH* t "\\.jar$"))
;;   (setq extra-classpaths '()))

;; (add-to-list 'load-path (concat *VENDOR-ROOT* "/swank-clojure"))
;; (require 'swank-clojure-autoload)
;; (swank-clojure-config
;;  (if (boundp '*SWANK-CLOJURE-JAR-PATH*)
;;      (setq swank-clojure-jar-path *SWANK-CLOJURE-JAR-PATH*))
;;  (setq swank-clojure-extra-classpaths extra-classpaths))
;;;;;; END

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
