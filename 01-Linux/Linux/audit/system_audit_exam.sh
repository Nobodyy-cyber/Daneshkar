#!/bin/bash
#Step1
mkdir -p ~/exam_results/audit/ cd ~/exam_results/audit/

echo "# System Audit Notes" > notes.txt
echo "# Current Working Directory" > cwd.txt
pwd >> cwd.txt

#Step2

echo "# List of system users" > users.txt
cut -d: -f1 /etc/passwd >> users.txt

echo "# Users with bash shell" > bash_users.txt

grep "/bin/bash" /etc/passwd >> bash_users.txt


echo "# Shell preview (First 5 lines)" > shell_preview.txt
sed 's|/bin/bash|/usr/bin/zsh|g' /etc/passwd | head -n 
5 >> shell_preview.txt

#step3

echo "# Kernel and System Info" > sysinfo.txt

uname -sr >> sysinfo.txt

arch >> sysinfo.txt

echo "# Group Summary (First 3 and Last 2)" > group_summary.txt

head -n 3 /etc/group >> group_summary.txt

tail -n 2 /etc/group >> group_summary.txt

#Step4

echo "# List of .conf files" > conf_files.txt
find /etc -maxdepth 1 -name "*.conf" >> conf_files.txt

echo "# Top 10 Largest Logs" > top_logs.txt

ls -lS /var/log | grep '^-' | head -n 10 >> top_logs.txt

## --- Step 5: Permissions ---

cp /etc/hosts hosts.bak
chmod 600 hosts.bak

echo "# Permissions details for hosts.bak" > hosts_perm.txt

#Step6
ls -l hosts.bak >> hosts_perm.txt
find . -maxdepth 1 -type f -name "*.txt" ! -name "hosts_perm.txt" ! -name "notes.txt" -delete
