# local-puppet-dev <img src="https://i.imgur.com/grQyxwI.png" height="5%" width="5%" align="left"/>

Simple docker setup for testing puppet manifests

- [local-puppet-dev](#local-puppet-dev)
  * [Usage](#usage)
    + [Start standalone puppet server](#start-standalone-puppet-server)
    + [Execute puppet agent](#execute-puppet-agent)
    + [Puppetfile](#puppetfile)
    + [Manifests](#manifests)
    + [Custom functions](#custom-functions)
    + [Custom facts](#custom-facts)

## Usage

### Start standalone puppet server

```bash
docker-compose up -d
```

### Execute puppet agent

```bash
# Daemon that executes the agent every 15s
./run_puppet_agent.sh
```

### Puppetfile

Puppet module dependencies should be added to the `Puppetfile`. Modules will be installed when you launch the `./run_puppet_agent.sh` daemon.

### Manifests

- Edit manifests in `./manifests`.
  - These are mapped into `/etc/puppetlabs/code/environments/production/manifests` in the puppet container.
- Changes made are reflected instantly.

### Custom functions

- Edit `.rb` files in `./functions`.
  - These are mapped into `/etc/puppetlabs/code/environments/production/lib/puppet/functions` in the puppet container.
- Changes made are reflected instantly and are accessible globally in manifests.

### Custom facts

- Edit `.rb` files in `./facter`.
  - These are mapped into `/etc/puppetlabs/code/environments/production/modules/facts/lib/facter` in the puppet container.
- Changes made are reflected instantly and are accessible globally in manifests.
