# SHR-AWS-Playbooks

Before running SHR-AWS-Playbooks, the following steps need to be followed
Ansible - Ensure you have something >2.1
brew install ansible

Python modules that we use
pip install boto
pip install awscli

echo "Configuring aws-cli. Remember to remove this step once we move to ansible 2.2. "
echo "Please decrypt secure_vars.yml to find the right values"
aws-configure

echo "Setting up ssh agent and adding HIE launch key"
eval "$(ssh-agent -s)"
ansible-vault decrypt group_vars/hie_launch_key.pem
ssh-add group_vars/hie_launch_key.pem

1. To Create a VPC
ansible-playbook -i inventory infra.yml -t create-vpc

2. To Create a Instances
ansible-playbook -i inventory infra.yml -t create-instance

3. To Setup a new user
ansible-playbook -i inventory manage_user.yml -t ssh-key

4. To Setup HA-Proxy
ansible-playbook -i inventory proxy.yml -t proxy

5. To Generate new ssl key on proxy box
ansible-playbook -i inventory certs.yml -t generate-cert
