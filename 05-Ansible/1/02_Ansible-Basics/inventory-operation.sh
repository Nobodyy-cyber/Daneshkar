#!/bin/bash
echo "=== Inventory as JSON ===" > inventory_operations.txt
ansible-inventory -i inventory --list >> inventory_operations.txt

echo -e "\n=== Inventory as YAML ===" >> inventory_operations.txt
ansible-inventory -i inventory --yaml >> inventory_operations.txt

echo -e "\n=== Webservers Group ===" >> inventory_operations.txt

ansible webservers -i inventory --list >> inventory_operations.txt

echo -e "\n=== All Hosts ===" --host >> inventory_operations.txt
ansible all -i inventory -hosts >> inventory_operations.txt

echo -e "\n=== Production Group Children ===" >> inventory_operations.txt
ansible production -i inventory --list-hosts >> inventory_operations.txt

echo -e "\n=== Variables for web1 ===" >> inventory_operations.txt

ansible-inventory -i inventory --host web1 >> inventory_operations.txt

echo -e "\n=== Ping All Hosts ===" >> inventory_operations.txt
ansible all -i inventory -m ping >> inventory_operations.txt
ansible-inventory -i inventory.ini --list
