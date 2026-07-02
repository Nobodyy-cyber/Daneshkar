#!/bin/bash

echo "=== Ping Test ===" > adhoc_output.txt
ansible localhost -m ping >> adhoc_output.txt

echo -e "\n=== Gather Facts ===" >> adhoc_output.txt
ansible localhost -m setup -a "filter=ansible_distribution*" >> adhoc_output.txt

echo -e "\n=== File Operations ===" >> adhoc_output.txt
ansible localhost -m file -a "path=/tmp/ansible_test state=directorymode=0755" >> adhoc_output.txt
ansible localhost -m stat -a "path=/tmp/ansible_test" >> adhoc_output.txt

echo -e "\n=== Command Execution ===" >> adhoc_output.txt
ansible localhost -m command -a "uptime" >> adhoc_output.txt
ansible localhost -m shell -a "echo $HOME && whoami" >>adhoc_output.txt


echo -e "\n=== Copy File ===" >> adhoc_output.txt
echo "Test content from ad-hoc" > /tmp/test_source.txt
ansible localhost -m copy -a "src=/tmp/test_source.txt
dest=/tmp/test_dest.txt" >> adhoc_output.txt


echo -e "\n=== Get URL ===" >> adhoc_output.txt
ansible localhost -m get_url -a "url=https://www.google.com
dest=/tmp/google.html" >> adhoc_output.txt

echo -e "\n=== Package Management ===" >> adhoc_output.txt
ansible localhost -m apt -a "name=curl state=present update_cache=yes" --become >> adhoc_output.txt 2>&1 || echo "Skipped no sudo access" >> adhoc_output.txt

