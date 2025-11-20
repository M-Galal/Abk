#ansible-galaxy collection install -r collections/requirements.yml
export SSHPASS=@bk@#321
IPs=("10.1.186.127" "10.1.186.128" "10.1.186.129" "SYSVMTCRXRMQ7" "SYSVMTCRXRMQ8" "SYSVMTCRXRMQ9")
for ip in "${IPs[@]}"; do
sshpass -e ssh-copy-id -o "StrictHostKeyChecking no" -i ~/.ssh/id_rsa.pub gbmuat@"$ip"
done
ansible-playbook -i inventory.ini site.yml -K
