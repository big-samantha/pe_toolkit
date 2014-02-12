require 'spec_helper'
require 'facter/has_working_sudo'

describe 'has_working_sudo' do
  it 'should return true if `sudo -v` exits 0' do
    Facter::Util::Resolution.stubs(:exec).with('sudo -v ; echo $?').returns('0')
    expect Facter.value('has_working_sudo').should be_true
  end

  it 'should return nil if `sudo -v` exits non-zero' do
    Facter::Util::Resolution.stubs(:exec).with('sudo -v ; echo $?').returns(nil)
    expect Facter.value('has_working_sudo').should be_nil
  end
end
