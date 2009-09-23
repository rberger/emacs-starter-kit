;; This file must be loaded by <user>.el
(setq *RUNA-ROOT* (concat *WORK-ROOT* "/runa"))
(setq *FURTIVE-ROOT* (concat *RUNA-ROOT* "/furtive"))
(setq *SWARMIJI-ROOT* (concat *RUNA-ROOT* "/swarmiji"))

(add-to-extra-classpath (concat *FURTIVE-ROOT* "/src/"))

(setq FURTIVE-JAVA-JARS
      (directory-files (concat *FURTIVE-ROOT* "/lib/java") t "\\.jar$"))
(setq SWARMIJI-JAVA-JARS
      (directory-files (concat *SWARMIJI-ROOT* "/lib/java") t "\\.jar$"))
(setq JAVA-JARS (append FURTIVE-JAVA-JARS SWARMIJI-JAVA-JARS))
(mapcar 'add-to-extra-classpath JAVA-JARS)

;; (setq CLOJURE-MODULES
;;       (mapcar 
;;       (lambda (clj_module) 
;; 	 (concat *FURTIVE-ROOT* "/lib/clojure/" clj_module "/src/")) 
;;        (cddr (directory-files (concat *FURTIVE-ROOT* "/lib/clojure")))))
;; (mapcar 'add-to-extra-classpath CLOJURE-MODULES)

(add-to-extra-classpath (concat *FURTIVE-ROOT* "/lib/clojure/capjure/src/"))
(add-to-extra-classpath (concat *FURTIVE-ROOT* "/lib/clojure/capjure/classes/"))
(add-to-extra-classpath (concat *FURTIVE-ROOT* "/lib/clojure/clj-utils/src/"))
(add-to-extra-classpath (concat *FURTIVE-ROOT* "/lib/clojure/clj-record/"))
(add-to-extra-classpath (concat *FURTIVE-ROOT* "/lib/clojure/webbing/src/"))
(add-to-extra-classpath (concat *FURTIVE-ROOT* "/lib/clojure/postal/src/clj/"))
(add-to-extra-classpath (concat *RUNA-ROOT* "/swarmiji/src/"))
