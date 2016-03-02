# Packer Templates
This is a collection of [Packer](http://packer.io) templates to give a starting point to teams/individuals who need to create custom baseboxes for datacenters, security, application stacks, dev environments, etc. Just edit the `ansible/vars` folder or even add your own roles to the `ansible/requirements.txt` file to customize your basebox. Some helpers have been included but are not necessary!

## Download Images
It is recommended you download images into the `/isos` folder so builds are faster, but it isn't necessary except for ESXi builds. Make sure you edit the names in the base templates.

## Install Ansible Roles
The Ansible roles will install in this directory. This makes it easier to and more predictable to work with Packer when uploading to the VM.

```
$ ansible-galaxy -r ansible/requirements.txt -f install
```

## Build A Box
Each OS has multiple versions and the variables can be changed per version if you wish. Just include the version file you want to build. You can also only build a certain type of image if you want.

```
$ packer build -only=virtualbox-iso -var-file=versions/ubuntu-15.04.json ubuntu.json
```

## Add A Box To Vagrant
Once builds are complete add a box to your local Vagrant repository to begin testing it and working with it.

```
$ vagrant box add namespace/box builds/name-of-build.box --provider=virtualbox
$ vagrant box add namespace/box builds/name-of-build.box --provider=vmware_desktop
```