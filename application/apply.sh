#!/bin/bash

check_environment () {
    local environment=$1
    local valid=0

    workspace_arr=(`ls -1 ../env`)
    for workspace in "${workspace_arr[@]}"; do
        if [[ ${workspace} = $environment ]]; then
            valid=1
            break
        fi
    done

    if [[ $valid -eq 0 ]]; then
        echo "Invalid argument.\n Usage: './apply.sh <workspace>'"
        exit 1
    fi
}

auto_approve=''

positional_args=()
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -auto-approve)
            auto_approve='-auto-approve'
            shift
        ;;
        *)
            positional_args+=("$1")
            shift
        ;;
    esac
done
set -- "${positional_args[@]}"

environment=$1
check_environment $environment

terraform workspace select $environment

terraform apply $auto_approve -var-file="../env/$environment/app.tfvars"
