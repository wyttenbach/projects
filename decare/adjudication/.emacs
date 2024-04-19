(defun ide ()
  ""
  (interactive)
  (idea))

;;gigaspaces
(defun gsm ()
  "gsm appserver."
  (interactive)
  (shell-command "gsm.bat &" "*gsm*" "*gsm*"))

(defun gsc ()
  "gsc appserver."
  (interactive)
  (shell-command "gsc.bat &" "*gsc*" "*gsc*"))

(defun gui ()
  "gui appserver."
  (interactive)
  (shell-command "gs-ui.bat &" "*gui*" "*gui*"))
