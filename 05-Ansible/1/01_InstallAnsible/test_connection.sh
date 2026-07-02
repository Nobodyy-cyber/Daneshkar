#!/bin/bash
#!/bin/bash
cd ansible_config

# تست اتصال به localhost
echo "=== Connection Test ===" > connection_test.txt
ansible localhost -m ping >> connection_test.txt

# مشاهده inventory به صورت JSON
echo -e "\n=== Inventory List ===" >> connection_test.txt
ansible-inventory --list >> connection_test.txt

# نمایش همه هاست‌ها
echo -e "\n=== All Hosts ===" >> connection_test.txt
ansible all --list-hosts >> connection_test.txt

# نمایش متغیرهای هاست localhost
echo -e "\n=== Host Variables ===" >> connection_test.txt
ansible-inventory --host localhost >> connection_test.txt
