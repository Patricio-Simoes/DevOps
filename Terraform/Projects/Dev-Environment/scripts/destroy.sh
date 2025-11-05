#! /bin/bash

COMMON_FILE="${PROJECT_DIR}/scripts/common.sh"

if [[ -f "$COMMON_FILE" ]]; then
  source "$COMMON_FILE"
else
  echo "ERROR: common.sh not found in working directory: $COMMON_FILE"
  exit 1
fi

configure_aws_cli

cd ${PROJECT_DIR}

terraform_init

terraform_select_workspace

terraform destroy -auto-approve -var-file="sandbox.tfvars"

if [[ $? -eq 0 ]]; then
  echo "Terraform destroy completed successfully!"
else
  echo "Terraform destroy failed."
  exit 1
fi