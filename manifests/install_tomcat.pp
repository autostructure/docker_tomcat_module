# Installs Java, a dependency for Tomcat
class docker_tomcat_module::install_tomcat {
  tomcat_install { '/usr/local/tomcat':
    ensure  => present,
    version => '8.5.23',
    user    => $docker_tomcat_module::user,
    group   => $docker_tomcat_module::group,
  }
}
