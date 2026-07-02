#!/bin/bash
echo "=== All Facts ===" > facts_demo.txt
ansible localhost -m setup >> facts_demo.txt

echo -e "\n=== Distribution Facts ===" >> facts_demo.txt
ansible localhost -m setup -a "filter=ansible_distribution*" >> facts_demo.txt

echo -e "\n=== Network Facts ===" >> facts_demo.txt
ansible localhost -m setup -a "filter=ansible_default_ipv4" >> facts_demo.txt

echo -e "\n=== Memory Facts ===" >> facts_demo.txt
ansible localhost -m setup -a "filter=ansible_memtotal_mb" >> facts_demo.txt

ansible localhost -m setup > facts_all.json
