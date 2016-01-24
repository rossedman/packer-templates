# Export Important Variables
```
export ATLAS_TOKEN="ApprovedAtlasToken"
export AWS_ACCESS_KEY="PutYourAccessKeyHere"
export AWS_SECRET_KEY="PutYourSecretKeyHere"
```

# Install OVF Plugin

```
git@github.com:frapposelli/packer-post-processor-vagrant-vmware-ovf.git
```

# Add Ansible Scripts
Configure your ansible variables before your box build

# Build Your AMI/Vagrant Image
Once you have your configuration options in place, run the build command:

```
$ packer build \
    -var 'aws_access_key=foo' \
    -var 'aws_secret_key=bar' \
    -var 'vm_name=whateverbox' \
    template.json
```

# Setup Up Atlas (Here)[https://www.packer.io/docs/post-processors/atlas.html]

```
export ATLAS_TOKEN="Whatever"
```

Create build to push to

```
packer push --name yourbox/here template.json
```

Log in and add your AWS tokens to the variables for you box.

# Build Local Instance

```
# instructions for importing a box
vagrant up
```

# Deploy Production Instance
First you must get your AMI key so that you can reference it when deploying your infrastructure...

```
$ aws ec2 describe-images --owners self
$ aws ec2 describe-images --owners self | grep -oh "ImageId.*"
```

Then run terraform to live production

```
$ terraform plan -var 'ami_id=ImageIdHere'
$ terraform apply -var 'ami_id=ImageIdHere'
```