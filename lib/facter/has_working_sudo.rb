# has_working_sudo.rb
# Determines if system sudo is functional for root, via sudo -v

Facter.add("has_working_sudo") do
  confine :kernel => "Linux"

  sudo_working = Kernel.system('sudo -v')

  setcode do
    if sudo_working == true
      true
    elsif sudo_working == false
      nil
    end
  end
end
