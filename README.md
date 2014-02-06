# pe_toolkit module.

The purpose of this module is to provide some basic monitoring for the health of a PE system, via Puppet runs. It's certainly not the ideal way to do monitoring, but it requires nothing of the user to get working - other than a working PE installation.

### Done

  * pe_postgres_installed fact
  * pe_postgres_freespace fact
  * has_working_sudo fact

### ToDo

  * pe_postgres_db_size fact
  * vacuum_full_possible fact
  * Type and provider that you use on your pe-postgres server that "fails" when you do not have enough space to perform a vacuum:full.
  

#### License

Apache 2.0


#### Contact

zachary @ puppetlabs DOT com


#### Support

Please log tickets and issues on the [GitHub tracker](https://github.com/zacharyalexstern/pe_toolkit/issues) for this project.
