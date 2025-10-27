Kafka + ZooKeeper Cluster on RHEL 9 (TLS, SELinux Enforcing, firewalld)

Inventory layout:
- SYSVMTCRXKFKB1..SYSVMTCRXKFKB6
- ZooKeeper voters run ONLY on SYSVMTCRXKFKB1..3
- Kafka brokers run on ALL 6 nodes

Run:
ansible-playbook -i inventory/hosts.ini playbook.yml
