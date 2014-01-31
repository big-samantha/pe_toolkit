# pe_postgres_freespace.rb
# Returns the amount of free space available to Puppet Labs-vendored PostgreSQL server.

Facter.add("pe_postgres_freespace") do
  confine :kernel => "Linux"
  confine :pe_postgres_installed => true

  setcode do
    Facter::Util::Resolution.exec("df /opt/puppet/var/lib/pgsql/ -h | awk '{ print $3 }' | tail -n 1")
  end
end
