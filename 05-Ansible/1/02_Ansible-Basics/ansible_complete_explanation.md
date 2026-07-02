┌─────────────────────────────────────────────────────────┐
│                    CONTROL NODE                         │
│  (Where Ansible is installed & commands are executed)  │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌──────────┐  ┌──────────┐  ┌──────────────────────┐ │
│  │Inventory │  │ Modules  │  │   Playbooks (YAML)   │ │
│  │(Hosts    │  │(Tasks)   │  │   - Tasks            │ │
│  │ List)    │  │          │  │   - Handlers         │ │
│  └──────────┘  └──────────┘  │   - Variables        │ │
│                               └──────────────────────┘ │
│  ┌──────────┐  ┌──────────┐                            │
│  │ Plugins  │  │  Roles   │                            │
│  │(Extend   │  │(Reusable │                            │
│  │ Features)│  │ Components)│                           │
│  └──────────┘  └──────────┘                            │
│                                                         │
└─────────────────┬───────────────────────────────────────┘
                  │
                  │ SSH (Linux) / WinRM (Windows)
                  │ (Push Model - pushes commands)
                  ▼
┌─────────────────────────────────────────────────────────┐
│                 MANAGED NODES                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐            │
│  │ Node 1   │  │ Node 2   │  │ Node N   │            │
│  │ (Linux)  │  │ (Linux)  │  │(Windows) │            │
│  └──────────┘  └──────────┘  └──────────┘            │
│          NO AGENTS REQUIRED!                            │
└─────────────────────────────────────────────────────────┘


##### AGENTLESS ARCHITECTURE EXPLAINED ####

##How Ansible communicates with remote machines:

    Linux/Unix → Uses SSH (port 22)

    Windows → Uses WinRM (Windows Remote Management)

##Benefits of Agentless:
    Simple installation - No agents to install on managed nodes
    Better security - No extra open ports needed (SSH/WinRM only)
    Faster startup - Ready to use immediately
    Easier maintenance - No agent upgrades required


##Why Ansible uses Push Model:

     Immediate execution (no waiting for polling)

     Better for ad-hoc commands

     Simpler troubleshooting

     More control over timing


##CORE COMPONENTS

    Control Node - System with Ansible installed

    Managed Nodes - Target systems being managed (no agents!)

    Inventory - List of all managed nodes (INI/YAML format)

    Modules - Units of code that perform specific tasks

    Playbooks - YAML files defining automation workflows

    Plugins - Extend Ansible functionality


##KEY ADVANTAGES SUMMARY

    Push-based architecture
    Agentless (SSH/WinRM)
    Idempotent executions
    YAML-based simple syntax
    Large community with 1000+ modules
    Easy to learn and use


    InShort: Ansible = Simple, Agentless, Push-based automation that uses SSH/WinRM to manage 
    infrastructure without installing anything on target systems.
