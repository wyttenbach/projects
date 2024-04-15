~/projects/va/src
15:53:52$ check-postgres
Checking postgres...localhost...127.0.0.1:5432...CLOSED
~/projects/va/src
15:53:58$ start-postgres
Bootstrap failed: 5: Input/output error
Try re-running the command as root for richer errors.
Error: Failure while executing; `/bin/launchctl bootstrap gui/501 /Users/wytten/Library/LaunchAgents/homebrew.mxcl.postgresql@14.plist` exited with 5.
~/projects/va/src
15:57:07$ type start-postgres
start-postgres is a function
start-postgres () 
{ 
    brew services start postgresql@14
}
~/projects/va/src
15:57:17$ sudo brew services start postgresql@14
Password:
Warning: Taking root:admin ownership of some postgresql@14 paths:
  /usr/local/Cellar/postgresql@14/14.10_1/bin
  /usr/local/Cellar/postgresql@14/14.10_1/bin/postgres
  /usr/local/opt/postgresql@14
  /usr/local/var/homebrew/linked/postgresql@14
This will require manual removal of these paths using `sudo rm` on
brew upgrade/reinstall/uninstall.
Warning: postgresql@14 must be run as non-root to start at user login!
==> Successfully started `postgresql@14` (label: homebrew.mxcl.postgresql@14)
~/projects/va/src
15:57:32$ 