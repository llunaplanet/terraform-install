#!/bin/sh

if [ ! -n "${WERCKER_TERRAFORM_INSTALL_VERSION}" ]; then
  error 'Please specify version property'
  exit 1
fi

# create terraform directory and export PATH
mkdir -p $HOME/terraform        
export PATH=$PATH:$HOME/terraform

# download terraform from latest       
cd $HOME/terraform 
wget https://releases.hashicorp.com/terraform/${WERCKER_TERRAFORM_INSTALL_VERSION}/terraform_${WERCKER_TERRAFORM_INSTALL_VERSION}_linux_amd64.zip
unzip terraform_${WERCKER_TERRAFORM_INSTALL_VERSION}_linux_amd64.zip 
rm terraform_${WERCKER_TERRAFORM_INSTALL_VERSION}_linux_amd64.zip 
