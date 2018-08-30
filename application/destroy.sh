#!/bin/sh

# Iterate the valid workspace values
workspace_arr=(`ls -1 ../env`)

valid=0

for workspace in "${workspace_arr[@]}"
do
    if [[ ${workspace} = $1 ]]
    then
        valid=1
        break
    fi
done

# Check if workspace is valid
if [[ ${valid} = 0 ]]
    then
        echo "Invalid argument.\n Usage: './destroy.sh <workspace>'"
        exit 1
fi

# Set the workspace
terraform workspace select $1

# Run Terraform plan
terraform destroy -var-file="../env/$1/app.tfvars"
