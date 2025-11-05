#! /bin/bash

COMMON_FILE="${PROJECT_DIR}/scripts/common.sh"

WORKSPACE="sandbox"

if [[ -f "$COMMON_FILE" ]]; then
  source "$COMMON_FILE"
else
  echo "ERROR: common.sh not found in working directory: $COMMON_FILE"
  exit 1
fi

configure_aws_cli

cd ${PROJECT_DIR}

terraform_init

terraform_select_workspace $WORKSPACE

if terraform validate; then
  echo "Terraform validation was successful. Running terraform plan..."
  terraform plan -input=false -var-file="${WORKSPACE}.tfvars"
else
  echo "Terraform validation failed. Skipping terraform plan."
  exit 1
fi