Kafka + ZooKeeper Ansible deploy (generated)

Structure:
- inventory.ini: sample inventory (6 kafka nodes, 3 zk nodes)
- site.yml: orchestration playbook
- roles/
  - common: install java, create users
  - certs: generate CA on control node and distribute certs (uses openssl on control node)
  - zookeeper: download, configure and run zookeeper as systemd service
  - kafka: download, configure brokers, TLS keystore/truststore creation, systemd service
  - monitoring: node_exporter + jmx_exporter placement and systemd unit

Notes & assumptions:
- The playbook generates a simple CA on the controller and signs per-host certs. For production, use an HSM or real CA.
- The kafka_version and zookeeper_version variables are set in inventory.ini; update as needed.
- This is a starting point and must be hardened: user accounts, secure passwords, production-grade cert lifecycle, metrics config tuning, JVM tuning, log rotation, system tuning (ulimits, disk, network).
- Tested for RHEL-like OS (yum/dnf). Adapt package names and paths for your environment.

References:
- Apache Kafka downloads and releases.
- Apache ZooKeeper releases and docs.
- Prometheus JMX Exporter repository.

