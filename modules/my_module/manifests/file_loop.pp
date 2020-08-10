# Sample resource definition
define my_module::file_loop(
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
