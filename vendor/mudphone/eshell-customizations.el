(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))

(setenv "MUDPHONE_DIR" (concat (getenv "HOME") "/.mudphone"))
(setenv "MUDPHONE_BIN" (concat (getenv "MUDPHONE_DIR") "/bin"))
(setenv "MUDPHONE_CONFIG" (concat (getenv "MUDPHONE_DIR") "/config"))

(setenv "FURTIVE_HOME" (concat (getenv "HOME") "/work/runa/furtive"))
(setenv "FURTIVE_ENV" "development")
(setenv "SWARMIJI_HOME" (concat (getenv "HOME") "/work/runa/swarmiji"))
(setenv "SWARMIJI_ENV" "development")
(setenv "SUMMARIZER_NS" "sphinx")

(setenv "HBASE_RUNNER_HOME" (concat (getenv "HOME") "/work/clojure/hbase-runner"))

(setq eshell-prompt-function
  (lambda ()
    (concat (format-time-string "%Y-%m-%d %H:%M" (current-time))
            " "
            (eshell/pwd)
            " "
            (eshell/branch)
            "\n"
      (if (= (user-uid) 0) "# " "$ "))))

(defun eshell/branch ()
  "Return the current git branch, if applicable."
  (let ((branch (concat "" (shell-command-to-string "git branch 2>/dev/null"))))
    (if (string-match "^\\* \\(.*\\)" branch)
        (concat "(" (match-string 1 branch) ") ")
      "")))