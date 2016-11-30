#!/usr/bin/env bash

#This tells you stuff that you need on your machine in order to run the plays mentioned.
printf "$0"
TEMP_SCRIPT_DIR=`dirname -- "$0"`
SCRIPT_DIR=`cd $TEMP_SCRIPT_DIR; pwd`
cd $SCRIPT_DIR/..


RED='\033[0;31m'
NC='\033[0m' # No Color
printf "${RED}Note: If this script fails, please take a look at the contents and uncomment lines that you think
may be required${NC}\n"


# Ansible - Ensure you have something >2.1
# brew install ansible

# Python modules that we use
# pip install boto
# pip install awscli

# echo "Configuring aws-cli. Remember to remove this step once we move to ansible 2.2. "
# echo "Please decrypt secure_vars.yml to find the right values"
# aws-configure

# echo "Setting up ssh agent and adding HIE launch key"
# eval "$(ssh-agent -s)"
# ansible-vault decrypt group_vars/hie_launch_key.pem
# ssh-add group_vars/hie_launch_key.pem

# To setup VPC from scratch, run the plays with tags in the following order
# 1. Run play with 'create-vpc' tag
# 2. Update box settings in 'configs/instances.yml'
# 3. Run play with 'create-instance' tag
# 4. Update 'group_vars/gatewayed.yml' and replace the bastion box ip with correct public ip.
# 5. Run play with 'ssh-key' tag
# 6. Update Proxy settings in 'roles/haproxy/templates/haproxy.j2'
# 7. Run play with 'proxy' tag

# Provide the tags to be run
ansible-playbook -i inventory infra.yml -v "${@:1}"
