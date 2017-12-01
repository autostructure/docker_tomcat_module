# Configure the Tomcat build
class docker_tomcat_module::secure {
  # ::cis_harden_tomcat::harden_catalina_home { '/usr/local/tomcat':
  #   owner => $docker_tomcat_module::user,
  #   group => $docker_tomcat_module::group,
  # }
# 
  # $docker_tomcat_module::wars.each | String $war, Hash $values | {
  #   $war_simple_name = split($war, '[.]')
# 
  #   ::cis_harden_tomcat::harden_application { $war_simple_name[0]:
  #     catalina_home => '/usr/local/tomcat',
  #     catalina_base => $values['catalina_base'],
  #     application   => $war_simple_name[0],
  #     user          => $docker_tomcat_module::user,
  #     group         => $docker_tomcat_module::group,
  #   }
  # }

  # Remove unneeded application_source
  file { '/usr/local/tomcat/webapps/docs':
    ensure => absent,
    force  => true,
  }

  file { '/usr/local/tomcat/webapps/examples':
    ensure => absent,
    force  => true,
  }

  file { '/usr/local/tomcat/webapps/host-manager':
    ensure => absent,
    force  => true,
  }

  file { '/usr/local/tomcat/webapps/manager':
    ensure => absent,
    force  => true,
  }
}
