## Whats Ansible.cfg  ##
   `ansible.cfg`
    is the main configuration file for Ansible that controls settings like inventory location
    SSH arguments, privilege escalation, timeouts, and logging,
    with precedence given to a file in the current working directory over the user's home directory or system-wide defaults.

## Basic Conf File Ansible  ##

  ` /etc/ansible/ansible.cfg (global), ~/.ansible.cfg (user), or ./ansible.cfg (project) `

    The priority order for `ansible.cfg` files is: **environment variable `ANSIBLE_CONFIG`** (highest)
    then **current working directory `./ansible.cfg`**, then **user home `~/.ansible.cfg`**
    and finally ** global `/etc/ansible/ansible.cfg`** (lowest)

 - **OR**
   1. ANSIBLE_CONFIG environment variable
   2. ansible.cfg ‫در‬ current directory
   3. ~/.ansible.cfg
   4. /etc/ansible/ansible.cfg

## Actions {Important} ##


 `1- Default Setting`
 `2- Priviege Escalation {setting Sudo su}`
 `3- Inventory Setting`

## Configuration Options ##

 ` Inventory: PATH Inventory `
 ` Host_Key_Cheking: Cheking SSH Host_Key `
 ` Remote_User: Default User For connection `
 ` Become: Cheking Privilege Escaltion `
 ` Gathering: Cheking Facts `
