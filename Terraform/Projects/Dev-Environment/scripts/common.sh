#! /bin/bash

configure_aws_cli() {
    aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
    aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
    aws configure set default.region "$AWS_DEFAULT_REGION"
    aws configure set default.output "json"
}

terraform_init() {
    echo "Initializing Terraform..."
    if ! terraform init -input=false; then
        echo "Terraform init failed. Exiting."
        exit 1
    fi
}

terraform_select_workspace() {
    local workspace=$1

    if terraform workspace list | grep -qE "^\*?\s*${workspace}\b"; then
        echo "Workspace '${workspace}' already exists. Selecting it..."
    else
        echo "Workspace '${workspace}' not found. Creating it..."
        terraform workspace new "$workspace"
    fi

    terraform workspace select "$workspace"
}