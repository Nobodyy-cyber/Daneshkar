## What's Modules ## 
 ** The Part Of Code That Run a Unic Job **
## Where Is Running Modules ##
 ** On Target Machine ** 
## How Modules Transport On Target Machine ##
 ** With Ansible **
## Custom Modules and Built-In Modules  ##


#### Type Of Modules  ####
 ** System Modulse : Yum , apt , service , groups **
 ** File Modules : Copy ، Template ، File ، Lineinfile ، Blockinfile **
 ** Command Modules: Command ، Shell ، Script ، Raw  **
 ** Cloud Modules: ec2 ،gce， azure_rm  **
 ** Network Modules: uri ،get_url ،slurp  **
 ** Database Modules: mysql_db ،postgresql_db  **
 ** System Modules  – `yum` (install httpd), `service` (restart sshd) **
 ** File Modules  – `copy` (upload a config file), `lineinfile` (ensure a line in /etc/hosts) **
 ** Command Modules  – `shell` (run a complex pipeline), `command` (run `ls -la` safely) **
 **Cloud Modules  – `ec2` (launch an AWS instance), `azure_rm` (create an Azure VM) **
 **Network Modules  – `uri` (make an HTTP API call), `get_url` (download a file from a URL) **
 **Database Modules – `mysql_db` (create a new MySQL database), `postgresql_db` (drop an existing PostgreSQL database) **

#### Diffrence Between command shell raw  ####
 ** Command Execute Without Shell is safetly But No Idempotent **
 ** run Command With shell Can Used redirect And pipes **
 ** raw run a Command Without Modules for System and Python  **

## When We Used Theme ##

** command **
- Use when you need a simple command without shell features like pipes, redirection, or environment variables (it's faster and more secure).  
** shell **
- Use when you need shell features like `|`,`>`,`&&`, or environment variables, and you trust the input
** raw **
- Use when the target host lacks Python (e.g., bootstrapping) or you need to run a command over SSH without the module subsystem
