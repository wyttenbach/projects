(defun reqs ()
  ""
  (interactive)
  (shell-command "reqs &" "*reqs*" "*reqs*"))

;; overrides
(defun start ()
  "Start appserver."
  (interactive)
  (shell-command "dovt jee-start &"))

(defun stop ()
  "Stop appserver."
  (interactive)
  (shell-command "jee-stop &" "*jee-stop*" "*jee-stop*"))

