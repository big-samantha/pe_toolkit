# pe_postgres_freespace_gb.rb
# Returns the amount of free space available to Puppet Labs-vendored PostgreSQL server.

Facter.add("pe_postgres_freespace_gb") do
  confine :kernel => "Linux"
  confine :pe_postgres_installed => true

  setcode do
    Facter::Util::Resolution.exec("df /opt/puppet/var/lib/pgsql/ | awk '{ print $3 }' | tail -n 1")
  end
end
