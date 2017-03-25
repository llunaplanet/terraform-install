#!/bin/sh

if [ ! -n "${WERCKER_TERRAFORM_INSTALL_VERSION}" ]; then
  error 'Please specify version property'
  exit 1
fi

if [ -f "$WERCKER_CACHE_DIR/terraform-$WERCKER_TERRAFORM_INSTALL_VERSION/terraform" ]; then
    debug 'terraform found in cache'
else
    debug 'terraform not found in cache, will download'
    mkdir -p $WERCKER_CACHE_DIR/terraform-$WERCKER_TERRAFORM_INSTALL_VERSION
    cd $WERCKER_CACHE_DIR/terraform-$WERCKER_TERRAFORM_INSTALL_VERSION
    wget https://releases.hashicorp.com/terraform/${WERCKER_TERRAFORM_INSTALL_VERSION}/terraform_${WERCKER_TERRAFORM_INSTALL_VERSION}_linux_amd64.zip
    unzip terraform_${WERCKER_TERRAFORM_INSTALL_VERSION}_linux_amd64.zip
    rm terraform_${WERCKER_TERRAFORM_INSTALL_VERSION}_linux_amd64.zip
fi

export PATH=$PATH:$WERCKER_CACHE_DIR/terraform-$WERCKER_TERRAFORM_INSTALL_VERSION
