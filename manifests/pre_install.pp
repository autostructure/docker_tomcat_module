# Installs Java, a dependency for Tomcat
class docker_tomcat_module::pre_install {
  user { $docker_tomcat_module::user:
    uid => 1500,
    gid => 1500,
  }

  group { $docker_tomcat_module::group:
    gid => 1500,
  }
}
