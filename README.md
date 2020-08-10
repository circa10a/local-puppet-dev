# local-puppet-dev <img src="https://i.imgur.com/grQyxwI.png" height="5%" width="5%" align="left"/>

Simple docker setup for testing puppet modules

- [local-puppet-dev](#local-puppet-dev)
  * [Usage](#usage)
    + [Start standalone puppet server](#start-standalone-puppet-server)
    + [Execute puppet agent](#execute-puppet-agent)
    + [Puppetfile](#puppetfile)
    + [Modules](#modules)
    + [Manifests](#manifests)

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

### Modules

See [module structure docs](https://puppet.com/docs/puppet/latest/modules_fundamentals.html)

- The `./modules` directory is the source for all custom puppet modules.
  - These are mapped into `/etc/puppetlabs/code/modules` in the puppet container.
  - Modules installed via the `Puppetfile` are installed in `/etc/puppetlabs/code/environments/production/modules`
- Changes made are reflected instantly.

```text
modules
└── my_module
    ├── data
    │   └── common.yaml
    ├── files
    │   └── sample.json
    ├── hiera.yaml
    ├── lib
    │   ├── facter
    │   └── puppet
    ├── manifests
    │   ├── file_loop.pp
    │   └── init.pp
    └── templates
        └── sample_template.json.epp
```

### Manifests

The entrypoint(`site.pp`) `contains` our custom modules, therefore executing them.

- The `manifests` directory is mapped into `/etc/puppetlabs/code/environments/production/manifests` in the puppet container.

```text
manifests
└── site.pp
```
