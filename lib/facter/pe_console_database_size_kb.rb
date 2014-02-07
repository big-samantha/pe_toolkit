# pe_console_database_size_kb.rb
# Determines size of console database, in kilobytes

Facter.add("pe_console_database_size_kb") do
  confine :has_working_sudo => true
  confine :pe_postgres_installed => true

  setcode do
    size_command = "sudo -u pe-postgres /opt/puppet/bin/psql -c \"SELECT pg_database_size(\'console\')\""
    db_size_full_return_value = Facter::Util::Resolution.exec(size_command)
    db_size_in_bytes = db_size_full_return_value.split("\n")[2].strip.to_i
    db_size_in_kilobytes = db_size_in_bytes / 1024
    db_size_in_kilobytes
  end
end
