# local-puppet-dev

Simple docker setup for testing puppet manifests

- [local-puppet-dev](#local-puppet-dev)
  * [Usage](#usage)
    + [Manifests](#manifests)
    + [Custom functions](#custom-functions)
    + [Custom facts](#custom-facts)
    + [Start standalone puppet server](#start-standalone-puppet-server)
    + [Execute puppet agent](#execute-puppet-agent)

## Usage

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

### Start standalone puppet server

```bash
docker-compose up -d
```

### Execute puppet agent

```bash
# Daemon that executes the agent every 15s
./run_puppet_agent.sh
```