#!/bin/bash
echo "=== First Run should create ===" > idempotency_demo.txt
ansible localhost -m file -a "path=/tmp/ansible_idempotency state=directory" >> idempotency_demo.txt
echo -e "\n=== Second Run should NOT create, changed=false ===" >> idempotency_demo.txt
ansible localhost -m file -a "path=/tmp/ansible_idempotency state=directory" >> idempotency_demo.txt
echo -e "\n=== Third Run should NOT create, changed=false ===" >> idempotency_demo.txt
ansible localhost -m file -a "path=/tmp/ansible_idempotency state=directory" >> idempotency_demo.txt
