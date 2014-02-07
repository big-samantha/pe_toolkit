require 'spec_helper'

describe 'pe_console_database_size_kb' do
  size_command = "sudo -u pe-postgres /opt/puppet/bin/psql -c \"SELECT pg_database_size(\'console\')\""
  
  it 'should return an integer' do
    Facter.fact(:has_working_sudo).stubs(:value).returns(true)
    Facter.fact(:pe_postgres_installed).stubs(:value).returns(true)
    Facter::Util::Resolution.stubs(:exec).with(size_command).returns('512000')
    expect Facter.value('pe_console_database_size_kb').should be_an(Integer)
  end
end
