## Setup Guide

### Step 1: 
git pull

### Step 2: 
Add .tfvars file

### Step 3 :
```terrafrom init ```

```terraform plan -var-file=file.tfvars```

```terraform validate -var-file=file.tfvars```

```terraform apply -var-file=file.tfvars```

edit hosts.yaml file

```ansible-playbook hosts.yaml```
