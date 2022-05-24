require 'spec_helper'

describe 'petclinic::default' do
    context 'updates apt repo' do
        it { is_expected.to update_apt_update('update_repo') }
    end
    
    context 'creates a Jar File' do
        it { is_expected.to create_file('/home/ubuntu/petclinic.jar') }
    end

    context 'creates a file for petclinic service' do
        it { is_expected.to create_file('/etc/systemd/system/petclinic.service') }
    end

    context 'creates a file for petclinic application properties' do
        it { is_expected.to create_file('/home/ubuntu/application.properties') }
    end

    context 'enables petclinic service' do
        it { is_expected.to enable_service('petclinic') }
    end

    context 'enables petclinic service' do
        it { is_expected.to start_service('petclinic') }
    end
end