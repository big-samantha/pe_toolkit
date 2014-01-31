require 'spec_helper'
require 'facter'
require 'facter/pe_postgres_installed.rb'

describe 'pe_postgres_installed' do
  rpmquery = 'rpm -qa pe-postgresql-server'
  Facter.fact(:kernel).stubs(:value).returns('Linux')

  it 'should return nil if rpmempty is true' do
    Facter::Util::Resolution.stubs(:exec).with(rpmquery).returns('')
    expect Facter.value('pe_postgres_installed').should be_nil
  end

  it 'should return true if rpmempty is false' do
    Facter::Util::Resolution.stubs(:exec).with(rpmquery).returns('pe-postgresql-server')
    expect Facter.value('pe_postgres_installed').should be_true
  end
end
