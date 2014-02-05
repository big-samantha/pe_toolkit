# pe_postgres_freespace.rb
# Returns the amount of free space available to Puppet Labs-vendored PostgreSQL server, in bytes.

Facter.add("pe_postgres_freespace") do
  confine :kernel => "Linux"
  confine :pe_postgres_installed => true

  setcode do
    dfout = Facter::Util::Resolution.exec("df /opt/puppet/var/lib/pgsql/")
    if dfout == nil
      nil
    else
      dfout.split("\n")[1].split[3].to_i
    end
  end
end
