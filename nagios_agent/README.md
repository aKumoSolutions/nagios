## NRPE Setup Guide

### Step 1: Modify nrpe_isntallation.yaml file

*Note: This step assumes the you have 2 hosts (Linux CentOS) added as managed hosts under your Ansible. You can modify "hosts" section based on your Ansible setup.*

Add servers IP to nrpe_installation file 

```vi nrpe_installation.yaml```

Run Ansible Playbook 

```ansible-playbook nrpe_installation.yaml```
