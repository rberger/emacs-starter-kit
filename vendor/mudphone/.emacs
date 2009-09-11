;; load path settings
(setq *USER-ROOT* (getenv "HOME"))
(setq *PERSONAL-ID* "mudphone")
(setq *PERSONAL-VENDOR* (concat *USER-ROOT* "/.emacs.d/vendor/" *PERSONAL-ID*))
(setq *WORK-ROOT* (concat *USER-ROOT* "/work"))
(setq *CLOJURE-ROOT* (concat *WORK-ROOT* "/clojure"))
(setq *RUNA-ROOT* (concat *WORK-ROOT* "/runa"))
(setq *FURTIVE-ROOT* (concat *RUNA-ROOT* "/furtive"))
(setq *SWARMIJI-ROOT* (concat *RUNA-ROOT* "/swarmiji"))

;; clojure-mode
(add-to-list 'load-path (concat *CLOJURE-ROOT* "/clojure-mode"))
(require 'clojure-mode)

(setq extra-classpaths (directory-files (concat *USER-ROOT* "/.clojure") t "\\.jar$"))
(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/src/"))

(defun add-to-extra-classpath (classpath-entry)
  (add-to-list 'extra-classpaths classpath-entry))

(setq FURTIVE-JAVA-JARS
      (directory-files (concat *FURTIVE-ROOT* "/lib/java") t "\\.jar$"))
(setq SWARMIJI-JAVA-JARS
      (directory-files (concat *SWARMIJI-ROOT* "/lib/java") t "\\.jar$"))
(setq JAVA-JARS (append FURTIVE-JAVA-JARS SWARMIJI-JAVA-JARS))
(mapcar 'add-to-extra-classpath JAVA-JARS)

(setq CLOJURE-MODULES
      (mapcar 
       (lambda (clj_module) 
	 (concat *FURTIVE-ROOT* "/lib/clojure/" clj_module "/src/")) 
       (cddr (directory-files (concat *FURTIVE-ROOT* "/lib/clojure")))))
(mapcar 'add-to-extra-classpath CLOJURE-MODULES)

(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/lib/clojure/capjure/src/"))
(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/lib/clojure/capjure/classes/"))
(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/lib/clojure/clj-utils/src/"))
(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/lib/clojure/clj-record/"))
(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/lib/clojure/webbing/src/"))
(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/lib/clojure/postal/src/clj/"))
(add-to-list 'extra-classpaths (concat *RUNA-ROOT* "/swarmiji/src/"))
(load (concat *PERSONAL-VENDOR* "/" *PERSONAL-ID* "_extra_classpaths.el"))

;; swank-clojure
(add-to-list 'load-path (concat *CLOJURE-ROOT* "/swank-clojure"))
(require 'swank-clojure-autoload)
(swank-clojure-config
 (setq swank-clojure-jar-path (concat *FURTIVE-ROOT* "/lib/java/clojure.jar"))
 (setq swank-clojure-extra-classpaths extra-classpaths))

;; slime
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(add-to-list 'load-path (concat *CLOJURE-ROOT* "/slime"))
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
 '(blink-cursor-mode t)
 '(debug-on-error t)
 '(indent-tabs-mode nil)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-width 2)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

;; Add Mudphone's custom settings:
(load (concat *PERSONAL-VENDOR* "/" *PERSONAL-ID* ".el"))