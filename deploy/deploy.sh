#!/bin/bash
terraform init

terraform apply

INSTANCE_IP=$(terraform output -json instance_ip | jq -r '.')

ansible-playbook local-playbook.yml

ansible-playbook remote-playbook.yml --extra-vars "target_ip=$INSTANCE_IP"
