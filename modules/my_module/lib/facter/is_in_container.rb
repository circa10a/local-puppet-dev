Facter.add(:is_in_container) do
  setcode do
    File.readlines("/proc/1/cgroup").grep(/(docker|lxc)/).size > 0
  end
end