# Sample resource definition
define file_loop(
  $ensure,
  $modes = [
    '0400',
    '0600',
    '0700',
    '0750'
  ]
){
  ensure_resources('file', {
    $name => {
      ensure => $ensure,
      mode   => random($modes)
    }
  })
}

$files = [
  "/tmp/${facts[fqdn]}",
  "/tmp/${facts[osfamily]}"
].downcase()

file_loop { $files:
  ensure => 'present'
}
