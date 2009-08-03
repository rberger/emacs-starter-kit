;; M-x slime   ;; to start slime
;; C-c C-z     ;; to run clojure buffer in inferior-lisp
;; C-c C-e     ;; to run last line in inferior-lisp
;; (or C-x C-e)

;; clojure-mode
(add-to-list 'load-path "~/work/clojure/clojure-mode")
(require 'clojure-mode)

;; load path settings
(setq *RUNA-ROOT* "~/work/runa")
(setq *FURTIVE-ROOT* (concat *RUNA-ROOT* "/furtive"))
(setq extra-classpaths (directory-files "~/.clojure" t "\\.jar$"))
(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/src/"))

(defun add-to-extra-classpath (classpath-entry)
  (add-to-list 'extra-classpaths classpath-entry))

(setq JAVA-JARS
      (directory-files (concat *FURTIVE-ROOT* "/lib/java") t "\\.jar$"))
(mapcar 'add-to-extra-classpath JAVA-JARS)

(setq CLOJURE-MODULES
      (mapcar 
       (lambda (clj_module) 
	 (concat *FURTIVE-ROOT* "/lib/clojure/" clj_module "/src/")) 
       (cddr (directory-files (concat *FURTIVE-ROOT* "/lib/clojure")))))
(mapcar 'add-to-extra-classpath CLOJURE-MODULES)

(add-to-list 'extra-classpaths (concat *RUNA-ROOT* "/webbing/src/"))
(add-to-list 'extra-classpaths (concat *RUNA-ROOT* "/clj-utils/src/"))
(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/lib/clojure/clj-record/"))
(add-to-list 'extra-classpaths (concat *RUNA-ROOT* "/swarmiji/src/"))
;(add-to-list 'extra-classpaths "~/.clojure/clojure-contrib.jar")
(add-to-list 'extra-classpaths "/Users/koba/work/clojure/mudphone/")


;; swank-clojure
(add-to-list 'load-path "~/work/clojure/swank-clojure")
(require 'swank-clojure-autoload)
(swank-clojure-config
 (setq swank-clojure-jar-path "~/.clojure/clojure.jar")
 (setq swank-clojure-extra-classpaths extra-classpaths))

;; slime
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(add-to-list 'load-path "~/work/clojure/slime")
(require 'slime)
(slime-setup)
;(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(ido-mode (quote both) nil (ido)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;;;; custom key bindings ;;;;;
(global-set-key "\C-z" 'slime-eval-buffer)

;; Start emacs server (for use with emacsclient):
(server-start)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(debug-on-error t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

;; Add Mudphone's custom settings:
(load "~/.emacs.d/vendor/mudphone/mudphone.el")

