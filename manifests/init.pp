# Sample class
class create_file(
  $file_name = undef
){
  if $file_name {
    ensure_resources('file', { $file_name => { 'ensure' => 'present' }})
  } else {
    notify{ 'file_name_undefined':
      message => 'No file name provided'
    }
  }
}

class { 'create_file':
  file_name => "/tmp/${facts[fqdn]}"
}
