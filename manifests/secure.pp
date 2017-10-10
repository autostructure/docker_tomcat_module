# Configure the Tomcat build
class docker_tomcat_module::secure {
  ::cis_harden_tomcat::harden_catalina_home { '/usr/local/tomcat':
    catalina_home => '/usr/local/tomcat',
    require       => ::Tomcat::Install['/usr/local/tomcat'],
  }

  $docker_tomcat_module::wars.each | String $war, Hash $values | {
    $war_simple_name = split($war, '[.]')

    ::cis_harden_tomcat::harden_application { $war_simple_name[0]:
      catalina_home => '/usr/local/tomcat',
      catalina_base => $values['catalina_base'],
      application   => $war_simple_name[0],
      require       => Exec["${values['catalina_base']}/webapps/${war}"],
    }
  }
}
