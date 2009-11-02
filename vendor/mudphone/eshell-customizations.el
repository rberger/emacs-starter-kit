
(setenv "MUDPHONE_DIR" (concat (getenv "HOME") "/.mudphone"))
(setenv "MUDPHONE_BIN" (concat (getenv "MUDPHONE_DIR") "/bin"))
(setenv "MUDPHONE_CONFIG" (concat (getenv "MUDPHONE_DIR") "/config"))

(setenv "FURTIVE_HOME" (concat (getenv "HOME") "/work/runa/furtive"))
(setenv "SWARMIJI_HOME" (concat (getenv "HOME") "/work/runa/swarmiji"))

(setq eshell-prompt-function
  (lambda ()
    (concat (format-time-string "%Y-%m-%d %H:%M" (current-time))
            " "
            (eshell/pwd)
      (if (= (user-uid) 0) " # " " $ "))))