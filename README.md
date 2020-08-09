# local-puppet-dev

Simple docker setup for testing puppet manifests

## Usage

- Edit manifests in `./manifests`.
  - These are mapped into `/etc/puppetlabs/code/environments/production/manifests` in the puppet container.
- Changes made are reflected instantly.

### Start standalone puppet server

```bash
docker-compose up -d
```

### Execute puppet agent

```bash
# Daemon that executes the agent every 15s
./run_puppet_agent.sh
```