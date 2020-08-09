# Sample resource definition
define file_loop(
  $ensure
){
  ensure_resources('file', { $name => { 'ensure' => $ensure }})
  exec { $name:
    path    => ['/usr/bin', '/bin', '/sbin/', '/usr/local/bin'],
    command => "rm -f ${name}",
  }
}

$files = [
  "/tmp/${facts[fqdn]}",
  "/tmp/${facts[osfamily]}"
].downcase()

file_loop { $files:
  ensure => 'present'
}
