dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift File.join(dir, 'lib')

require 'mocha'
require 'puppet'
require 'rspec'
require 'facter'
require 'puppetlabs_spec_helper/puppetlabs_spec_helper'
require 'facter/pe_postgres_freespace.rb'
require 'facter/pe_postgres_installed.rb'
require 'facter/pe_console_database_size_kb.rb'
require 'facter/has_working_sudo.rb'

RSpec.configure do |config|
    config.mock_with :mocha
    config.before :each do
      Facter.clear
      Facter.clear_messages
      Facter.fact(:kernel).stubs(:value).returns('Linux')
    end
end

# We need this because the RAL uses 'should' as a method.  This
# allows us the same behaviour but with a different method name.
class Object
    alias :must :should
end
