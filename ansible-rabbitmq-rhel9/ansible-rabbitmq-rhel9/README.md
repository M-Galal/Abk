# Ansible — RabbitMQ Cluster on RHEL 9

This project installs **RabbitMQ** on Red Hat Enterprise Linux 9 (or compatible) VMs, configures the same Erlang cookie across nodes, enables the management UI, opens firewall ports, and forms a cluster.

It supports:
- RHEL 9 / Rocky 9 / Alma 9
- Cluster formation using classic_config (static host list)
- Users, vhosts, permissions
- Idempotent re-runs
- Optional uninstall play (cleanup)

> **Tip:** Put real passwords in **Ansible Vault**. The defaults here are placeholders for a quick test.

## Quick start

1. Update `inventory.ini` with your hosts and SSH user.
2. Adjust variables in `group_vars/rabbitmq.yml` (especially `rabbitmq_erlang_cookie` and credentials).
3. Run:

```bash
ansible-playbook -i inventory.ini site.yml
```

To remove/uninstall:

```bash
ansible-playbook -i inventory.ini uninstall.yml
```

## Requirements on control node
- Ansible 2.14+
- Python 3.9+

## Notes
- Hostname resolution matters. Each node's hostname should resolve for all peers. Prefer shortnames and set `rabbitmq_use_shortnames: true` (default).
- The cluster uses `classic_config` with a static list of nodes from your inventory group `rabbitmq`.
- Management UI: http://<host>:15672  (unless you change `rabbitmq_management_port`)
- Default user creation is optional; disable via `rabbitmq_create_default_user: false`.
