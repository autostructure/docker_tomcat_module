# Installs Java, a dependency for Tomcat
class docker_tomcat_module::install_tomcat {
  ::tomcat::install { '/usr/local/tomcat':
    user       => 'tomcat_admin',
    group      => 'tomcat',
    source_url => 'http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.0.46/bin/apache-tomcat-8.0.46.tar.gz',
    require    => Class['::java'],
  }
}
