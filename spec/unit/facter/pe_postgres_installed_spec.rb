require 'spec_helper'
require 'facter'

describe 'pe_postgres_installed' do
#  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }
  Facter::Util::Resolution.stubs(:exec).with('rpm -qa pe-postgresql-server').returns('')

  it 'should return nil if rpmempty is an empty string' do
    expect Facter.value('pe_postgres_installed').should be_nil
  end
end
