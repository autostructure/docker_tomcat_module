require 'spec_helper'

describe 'docker_tomcat_module' do
  context 'with default values for all parameters' do
    let(:facts) {
      {
        'osfamily' => 'RedHat',
        'operatingsystem' => 'CentOS',
        'operatingsystemrelease' => '7'
      }
    }

    it { should contain_class('docker_tomcat_module') }
  end
end
