# Install Ansible Roles

```
$ ansible-galaxy -r ansible/requirements.txt -f install
```

# Load ATLAS_TOKEN

```
$ source ~/.dotfiles/zsh/tokens.sh
```

# Push To Packer

```
$ packer push -var 'box_version=0.1.0' base.json
```