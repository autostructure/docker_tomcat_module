# Class: docker_tomcat_module
# ===========================
#
# Full description of class docker_tomcat_module here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'docker_tomcat_module':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Autostructure
#
class docker_tomcat_module(
  Hash $properties_properties = {},
  Hash $servers = {},
  Hash $server_connectors = {},
  Hash $server_contexts = {},
  Hash $server_engines = {},
  Hash $server_globalnamingresources = {},
  Hash $server_hosts = {},
  Hash $server_listeners = {},
  Hash $server_realms = {},
  Hash $server_services = {},
  Hash $server_tomcat_users = {},
  Hash $server_valves = {},
  Hash $contexts = {},
  Hash $context_environments = {},
  Hash $context_managers = {},
  Hash $context_resources = {},
  Hash $context_resourcelinks = {},
  Hash $context_valves = {},
  Hash $setenv_entries = {},
  Hash $wars = {},
  Array $tomcat_libraries = [],
  Array $environment_vars = [],
  String $user = 'root',
  String $group = 'root',
) {
  #class { '::docker_tomcat_module::pre_install': }
  # class { '::docker_tomcat_module::install_java': }
  class { '::docker_tomcat_module::install_tomcat': }
  -> class{ '::docker_tomcat_module::configure': }
  -> class{ '::docker_tomcat_module::secure': }
  -> Class['::docker_tomcat_module']
}
