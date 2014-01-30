# pe_postgres_installed.rb
# Determines if system has Puppet Labs-vendored PostgreSQL server installed.

Facter.add("pe_postgres_installed") do
  confine :kernel => "Linux"
  setcode do
    rpmoutput = Facter::Util::Resolution.exec('rpm -qa pe-postgresql-server')
    if rpmoutput.to_s.empty? == true
      nil
    else
      true
    end
  end
end
