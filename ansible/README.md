# Ansible modules

## Usage

```bash
ansible-playbook -i ./hosts ./pica8.yml
```

## hosts
File includes list of hosts and groups
Group [pica-config] is default group and includes 1 host (localhost)
For example, to enable 'pica8_config' Ansible module for sanfansico-113 and sanfansico-114 nodes

```yaml
[pica-config]
sanfansico-113
sanfansico-114
```

Note that sanfansico-113 and sanfansico-114 are hostnames of machines which can be resolved with DNS or local hosts file. Here also can be IP address or FQDNs

## pica8.yml
This file defines to which hosts\groups role 'pica8_config' will be applied
By default it uses [pica-config] group from 'hosts' file

```yaml
- hosts: pica-config
  remote_user: root

    roles:
        - pica8_config
```

### group_vars/pica-config
File includes variables which are used for module

```yaml
config_dir: '/pica/config'
config_file: 'ansible_pica.conf'
```

### roles/pica8_config/tasks
Main playbook which deploys configuration files for Pica Ansible module.

```yaml
- name: Create pica directory
  file: path={{config_dir}} state=directory mode=0755
  
  - name: Install pica config file
    copy: src={{config_file}} dest={{config_dir}}/{{config_file}} mode=0644
      notify: load_config
```
