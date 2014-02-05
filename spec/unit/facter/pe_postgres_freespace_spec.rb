require 'spec_helper'
require 'facter'

describe 'pe_postgres_freespace' do

  dfcommand = 'df /opt/puppet/var/lib/pgsql/'
  dfsuccess = 'Filesystem                   1K-blocks    Used Available Use% Mounted on\n/dev/mapper/VolGroup-lv_root   8712392 1725288   6544532  21% /'
  dffail = nil

  Facter.fact(:pe_postgres_installed).stubs(:value).returns(true)

  it 'should return nil if df returns no such file or directory' do
    Facter::Util::Resolution.stubs(:exec).with(dfcommand).returns(dffail)
    Facter.value('pe_postgres_freespace').should be_nil
  end

  it 'should return an integer if df succeeds' do
    Facter::Util::Resolution.stubs(:exec).with(dfcommand).returns(dfsuccess)
    Facter.value('pe_postgres_freespace').should be_an(Integer)
  end

end
