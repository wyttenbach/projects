;; (defun mongo ()
;;   "Start mongo shell."
;;   (interactive)
;;   (shell-command "mongo &" "*mongo*" "*mongo*"))
(home)
(goto-char (point-max))
(insert "ls -l $MONGO_DUMP")
