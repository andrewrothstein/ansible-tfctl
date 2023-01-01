andrewrothstein.tfctl
=========

![Build Status](https://github.com/andrewrothstein/ansible-tfctl/actions/workflows/build.yml/badge.svg)

Installs WeaveWorks [Terraform Controller](https://github.com/weaveworks/tf-controller) cli.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.tfctl
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
