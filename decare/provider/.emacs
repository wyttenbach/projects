(defun vagrant ()
  "Start Vagrant."
  (interactive)
  (shell-command "(cd /c/dev/vagrant-boxes/OracleDatabase/19.3.0; vagrant up) &"))

(defun vagrant-down ()
  "Stop Vagrant."
  (interactive)
  (shell-command "(cd /c/dev/vagrant-boxes/OracleDatabase/19.3.0; vagrant halt) &"))

(defun ide ()
  ""
  (interactive)
  (idea))

(custom-set-variables
 '(mode-require-final-newline nil)
)
