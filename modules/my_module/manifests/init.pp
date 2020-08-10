class my_module(
  # data/common.yaml
  Array $files_to_create
){
  # Convert input file names to lowercase
  $files = $files_to_create.downcase()
  # Use custom resource to randomly change file permissions
  my_module::file_loop { $files:
    ensure => 'present'
  }
  # Utilize custom fact to determine if in docker or lcx
  if $facts[is_in_container] or $facts[virtual] == 'docker' {
    notify{'Running in container':}
  }
  # Create static file
  file { '/tmp/sample.json':
    source => "puppet:///modules/${module_name}/sample.json"
  }
  # Create json file from template + stdlib
  file { '/tmp/dynamic.json':
    content => epp('my_module/sample_template.json.epp', { file_content => to_json({ files => $files }) })
  }
}
