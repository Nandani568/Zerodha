#!/bin/bash

# Check if Vagrant is installed
if ! command -v vagrant &>/dev/null; then
    echo "Vagrant is not installed. Please install Vagrant and try again."
    exit 1
fi

# Check if the VM is already running
if vagrant status | grep "demo-ops" | grep -q "running"; then
    echo "The 'demo-ops' VM is already running."
    exit 0
fi

# Define Vagrantfile content here

# Initialize and provision the VM
vagrant up

# Check for errors during provisioning
if [ $? -ne 0 ]; then
    echo "Error provisioning the VM. Check the Vagrant logs for details."
    exit 1
fi

echo "The 'demo-ops' VM has been provisioned successfully."
