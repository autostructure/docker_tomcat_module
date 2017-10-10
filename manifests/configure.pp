# Configure the Tomcat build
class docker_tomcat_module::configure {
  $docker_tomcat_module::wars.each | String $war, Hash $values | {
    ::tomcat::war { $war:
      catalina_base   => $values['catalina_base'],
      app_base        => $values['app_base'],
      deployment_path => $values['deployment_path'],
      war_ensure      => $values['war_ensure'],
      war_name        => $values['war_name'],
      war_purge       => $values['war_purge'],
      war_source      => $values['war_source'],
      allow_insecure  => $values['allow_insecure'],
    }
  }

  $docker_tomcat_module::properties_properties.each | String $properties_property, Hash $values | {
    ::tomcat::config::properties::properties { $properties_property:
      catalina_base => $values['catalina_base'],
      value         => $values['value'],
      property      => $values['property'],
    }
  }

  $docker_tomcat_module::servers.each | String $server, Hash $values | {
    ::tomcat::config::server { $server:
      catalina_base     => $values['catalina_base'],
      class_name        => $values['class_name'],
      class_name_ensure => $values['class_name_ensure'],
      address           => $values['address'],
      address_ensure    => $values['address_ensure'],
      port              => $values['port'],
      shutdown          => $values['shutdown'],
      server_config     => $values['server_config'],
    }
  }

  $docker_tomcat_module::server_connectors.each | String $server_connector, Hash $values | {
    ::tomcat::config::server::connector { $server_connector:
      catalina_base         => $values['catalina_base'],
      connector_ensure      => $values['connector_ensure'],
      port                  => $values['port'],
      protocol              => $values['protocol'],
      parent_service        => $values['parent_service'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
      purge_connectors      => $values['purge_connectors'],
      server_config         => $values['server_config'],
    }
  }

  $docker_tomcat_module::server_contexts.each | String $server_context, Hash $values | {
    ::tomcat::config::server::context { $server_context:
      catalina_base         => $values['catalina_base'],
      context_ensure        => $values['context_ensure'],
      doc_base              => $values['doc_base'],
      parent_service        => $values['parent_service'],
      parent_engine         => $values['parent_engine'],
      parent_host           => $values['parent_host'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
      server_config         => $values['server_config'],
    }
  }

  $docker_tomcat_module::server_engines.each | String $server_engine, Hash $values | {
    ::tomcat::config::server::engine { $server_engine:
      default_host                      => $values['default_host'],
      catalina_base                     => $values['catalina_base'],
      background_processor_delay        => $values['background_processor_delay'],
      background_processor_delay_ensure => $values['background_processor_delay_ensure'],
      class_name                        => $values['class_name'],
      class_name_ensure                 => $values['class_name_ensure'],
      engine_name                       => $values['engine_name'],
      jvm_route                         => $values['jvm_route'],
      jvm_route_ensure                  => $values['jvm_route_ensure'],
      parent_service                    => $values['parent_service'],
      start_stop_threads                => $values['start_stop_threads'],
      start_stop_threads_ensure         => $values['start_stop_threads_ensure'],
      server_config                     => $values['server_config'],
    }
  }

  $docker_tomcat_module::server_globalnamingresources.each | String $server_globalnamingresource, Hash $values | {
    ::tomcat::config::server::globalnamingresource { $server_globalnamingresource:
      ensure                => $values['ensure'],
      resource_name         => $values['resource_name'],
      type                  => $values['type'],
      catalina_base         => $values['catalina_base'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
      server_config         => $values['server_config'],
    }
  }

  $docker_tomcat_module::server_hosts.each | String $server_host, Hash $values | {
    ::tomcat::config::server::host { $server_host:
      app_base              => $values['app_base'],
      catalina_base         => $values['catalina_base'],
      host_ensure           => $values['host_ensure'],
      host_name             => $values['host_name'],
      parent_service        => $values['parent_service'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
      server_config         => $values['server_config'],
      aliases               => $values['aliases'],
    }
  }

  $docker_tomcat_module::server_listeners.each | String $server_listener, Hash $values | {
    ::tomcat::config::server::listener { $server_listener:
      catalina_base         => $values['catalina_base'],
      listener_ensure       => $values['listener_ensure'],
      class_name            => $values['class_name'],
      parent_service        => $values['parent_service'],
      parent_engine         => $values['parent_engine'],
      parent_host           => $values['parent_host'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
      server_config         => $values['server_config'],
    }
  }

  $docker_tomcat_module::server_realms.each | String $server_realm, Hash $values | {
    ::tomcat::config::server::realm { $server_realm:
      catalina_base         => $values['catalina_base'],
      class_name            => $values['class_name'],
      realm_ensure          => $values['realm_ensure'],
      parent_service        => $values['parent_service'],
      parent_engine         => $values['parent_engine'],
      parent_host           => $values['parent_host'],
      parent_realm          => $values['parent_realm'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
      purge_realms          => $values['purge_realms'],
      server_config         => $values['server_config'],
    }
  }

  $docker_tomcat_module::server_services.each | String $server_service, Hash $values | {
    ::tomcat::config::server::service { $server_service:
      catalina_base     => $values['catalina_base'],
      class_name        => $values['class_name'],
      class_name_ensure => $values['class_name_ensure'],
      service_ensure    => $values['service_ensure'],
      server_config     => $values['server_config'],
    }
  }

  $docker_tomcat_module::server_tomcat_users.each | String $server_tomcat_user, Hash $values | {
    ::tomcat::config::server::tomcat_users { $server_tomcat_user:
      ensure        => $values['ensure'],
      element       => $values['element'],
      element_name  => $values['element_name'],
      catalina_base => $values['catalina_base'],
      file          => $values['file'],
      manage_file   => $values['manage_file'],
      owner         => $values['owner'],
      group         => $values['group'],
      password      => $values['password'],
      roles         => $values['roles'],
    }
  }

  $docker_tomcat_module::server_valves.each | String $server_valve, Hash $values | {
    ::tomcat::config::server::valve { $server_valve:
      catalina_base         => $values['catalina_base'],
      class_name            => $values['class_name'],
      parent_host           => $values['parent_host'],
      parent_service        => $values['parent_service'],
      parent_context        => $values['parent_context'],
      valve_ensure          => $values['valve_ensure'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
      server_config         => $values['server_config'],
    }
  }

  $docker_tomcat_module::contexts.each | String $context, Hash $values | {
    ::tomcat::config::context { $context:
      catalina_base => $values['catalina_base'],
    }
  }

  $docker_tomcat_module::context_environments.each | String $context_environment, Hash $values | {
    ::tomcat::config::context::environment { $context_environment:
      ensure                => $values['ensure'],
      catalina_base         => $values['catalina_base'],
      environment_name      => $values['environment_name'],
      type                  => $values['type'],
      value                 => $values['value'],
      description           => $values['description'],
      override              => $values['override'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
    }
  }

  $docker_tomcat_module::context_managers.each | String $context_manager, Hash $values | {
    ::tomcat::config::context::manager { $context_manager:
      ensure                => $values['ensure'],
      catalina_base         => $values['catalina_base'],
      manager_classname     => $values['manager_classname'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
    }
  }

  $docker_tomcat_module::context_resources.each | String $context_resource, Hash $values | {
    ::tomcat::config::context::resource { $context_resource:
      resource_name         => $values['resource_name'],
      resource_type         => $values['resource_type'],
      catalina_base         => $values['catalina_base'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
    }
  }

  $docker_tomcat_module::context_resourcelinks.each | String $context_resourcelink, Hash $values | {
    ::tomcat::config::context::resourcelink { $context_resourcelink:
      ensure                => $values['ensure'],
      catalina_base         => $values['catalina_base'],
      resourcelink_name     => $values['resourcelink_name'],
      resourcelink_type     => $values['resourcelink_type'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
    }
  }

  $docker_tomcat_module::context_valves.each | String $context_valve, Hash $values | {
    ::tomcat::config::context::valve { $context_valve:
      ensure                => $values['ensure'],
      resource_name         => $values['resource_name'],
      resource_type         => $values['resource_type'],
      catalina_base         => $values['catalina_base'],
      additional_attributes => $values['additional_attributes'],
      attributes_to_remove  => $values['attributes_to_remove'],
    }
  }
}
