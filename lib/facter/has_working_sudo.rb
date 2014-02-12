# has_working_sudo.rb
# Determines if system sudo is functional for root, via sudo -v

Facter.add("has_working_sudo") do
  confine :kernel => "Linux"

  sudo_working = Facter::Util::Resolution.exec('sudo -v ; echo $?')

  setcode do
    if sudo_working == '0'
      true
    elsif sudo_working == nil
      nil
    end
  end
end
