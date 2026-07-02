## About this project ##

` WE LEARN WHATS ANSIBLE AND HOW WE CAN INSTALL , CHECK VERSION AND MODULES `
` How WORKED ANSIBLE AND FOR WHAT `
` DIFFRENCE BETWEEN APT && PIP AND WE UNDERSTAND USED PIP FOR PRODUCTION `
` Builting Michael DeeHan in 2012 And Now This App bught with REDHAT `

` Benefits of Agentless:`
    Simple installation - No agents to install on managed nodes
    Better security - No extra open ports needed (SSH/WinRM only)
    Faster startup - Ready to use immediately
    Easier maintenance - No agent upgrades required `

` ADVANTAGE THE ANSIBLE  `

    IDEMPOTENCY , AGANTLESS , SIMPLICITY , POWERFUL

` DISADVANTAGE ANSIBLE WITH OTHER `

    PUPPET USED PULL MODULE BUT ANSIBLE USED PUSH
    ANSIBLE SO SIMPLE BUT CHEF NO
    SALTSTACK FASTER BUT NO SIMPLE LOKE ANSIBLE

 *PUSH -> CONTROL NODE SEND CAOMMAND TO MANAGED_NODE  AND PULL -> MANAGED NODE CONNECT THE SERVER IN ANSIBLE*

`Inventory is the complete list of items, goods, or materials that a busine Its primary role is to track what is available`
    --LIST IN INVENTROY SHOW COMPELTE STRUCTURE OF INVENTROY
    WE CAN USED YAML FORMAT FOR INVENTORY
    GROUP USED FOR MANAGED HOSTS
    PARENTS GROUP DEFINE BY CHILDREN
` Idempotency -> Execute for Multitime and Equal Result `

    Security
    Debugging

`Advantage State Management`

    Auto Idempotency
    Readable
    Simple Maintanance

*WE LEARN HOW ANSIBLE GRONTIED IDEMPOTENCY*
*wE UDERSTADING MODULES THAT IS A UNIT FROM CODE AND EXECUTED SPECIAL TASK  AND HOW USED IN DOCUMENTATION*

    WE HAVE MANY TYPE OF MODULES :
    SYSTEM MODULES
    FILE MODULES
    COMMAND MODULES
    CLOUD MODULES
    NETWORK MODULES
    DB_MODULES

*WE LOOK THE DIFFRENCE SHELL && RAW COMMAND*

    SHELL: SAFTLY BUT NOT IDEMPOTANT AND CAN USED PIPES , REDIRECTS
    RAW: EXECUTED PYTHON_COMMAND FOR SYSTEMS

*ANSIBLE_CONCEPT*

    Run `ansible-doc -l` to list all modules, or `ansible-doc <module_name>` 
    (e.g., `ansible-doc copy`) to view detailed documentation,
    including descriptions, options, and examples directly in your terminal.
    Read the "OPTIONS" or "PARAMETERS" section in the output, which lists each parameter's name,
    data type (string/bool/list), whether it's required,
    default values, and a description of its purpose—focus on required: true
    and alias names to grasp essential usage.

*ABOUT FACTS*

    ALL OF GATHERING_INFO FROM TARGET MACHINES
    GATHER_FACTS = YES cONSSIT OF :
    SYS INFO , NETWORK INFO HARDWARE INFO

*ABOUT VARS*

    DEFINE IN PLAYBOOK ,
    IN INVENTORY inventory:[group:vars] COMMAND LINE -e "var=value" ,
    IN FILES 

## Installing && Configuration Ansible  ##

 ` INSTALL wihth python and pip3 `
    pip3 install --user ansible  And Added pipbin to PATH -> Export PATH=$PATH:~/.local/bin
    CHECKING VERSION
    CREATING Ansible.cfg THAT CONSIST OF DEFAULT , PRIVILEGE ESCALATION , INVENTORY , LOCAL , WEB_SERVER , DB_SERVER ALL;VARS 

*WHATS ANSIBLE_CFG*

    is the main configuration file for Ansible that controls settings like inventory location
    SSH arguments, privilege escalation, timeouts, and logging,
    with precedence given to a file in the current working directory over the user's home directory or system-wide defaults
    THAT CONSIST OF ENVIORMENT VARS , CURENT DIRECTORY , ~/.ansible.cfg , /etc/ansible/ansible.cfg

## STRUCTURAL OF FILES && Detaile Parts ##

` Linux/Unix → Uses SSH (port 22) ##  Windows → Uses WinRM (Windows Remote Management) `
    CONSIST OF CONTROL-NODE(WHERE IS INSTALLED ANSIBLE THATS PART INVENTORY , MODULES PLAYBOOK , PLUGINS , ROLES)
    MANAGE-NODE (TARGET SYSTEM)
    AGENTLESS ARCHITECTURE
 
` Inventory - List of all managed nodes (INI/YAML format)`

    Modules - Units of code that perform specific tasks

    Playbooks - YAML files defining automation workflows

    Plugins - Extend Ansible functionality

*Push-based architecture*

    Agentless (SSH/WinRM)
    Idempotent executions
    YAML-based simple syntax
    Large community with 1000+ modules
    Easy to learn and use


    InShort: Ansible = Simple, Agentless, Push-based automation that uses SSH/W>
    infrastructure without installing anything on target systems.


## How Run AD_HOC COMMANDS  ##

*A Example To Usedad_hoc command*
ansible <hosts> -m <module> -a "<arguments>" [options]

## WHAT'S WE LEARN ABOUT THIS PROJECT  ##

     WE LEARN HOW WE INSTALL && RUN THE ANSIBLE AND BETTER THAN USED PIP IN PRODUCTION
     AND ANSIBLE STRUCTURAL_FILE : LIKE WE CAN USED(YAML_FILE) , ARCHITECTURE .
     WHATS INVENTORY , PLAYBOOKS , MODULES , PLUGINS , FACTS , VARS 

