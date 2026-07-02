## Whats FACT  ##
 
 ** Information from Target Machines  **

## Gather_Facts  ##

 ** gather_facts: yes  collects system information (OS, IPs, CPU, memory, disk, hostname, etc.)
 from target hosts via the setup module,
 storing them as variables (facts) for use in playbooks **

 ** System info** hostname ،OS ،architecture
 ** Network info ** IP addresses ،interfaces
 ** Hardware info ** CPU ،memory ،disks
## how We Can See Facts ##

 ** ansible -m setup  **

 ** ansible_facts ** is a `dictionary` that holds all system facts gathered from the target host (e.g.,`ansible_facts['os_family']`
 ** accessible as a single structured variable **

**ansible_** variables (e.g.,`ansible_os_family`,`ansible_default_ipv4`)are
** deprecated,top-level shorthand aliases ** that point to the same values 
inside`ansible_facts`but you should now use `ansible_facts` directly for clarity and forward compatibility.

## Var In Ansible ##
 ** var in playbook **
 ** In inventory: [group:vars] **
 ** in command line: -e `var=value` **
 ** in files: vars_files: **


 ** Variable precedence in Ansible determines ** which value wins when the same variable is defined in multiple places
  - following a hierarchy from lowest (e.g., role defaults) to highest (e.g., extra vars via `--extra-vars`)
  - with the highest precedence overriding all lower ones.


## how We Used Variable  ##
 ** `({{ variable_name }})` **


