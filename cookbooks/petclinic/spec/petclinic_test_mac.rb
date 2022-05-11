require 'spec_helper'

describe 'petclinic::mac' do
    context 'updates apt repo' do
        it { is_expected.to update_apt_update('update_repo') }
    end
    
    context 'creates a remote_file with the default action' do
        it { is_expected.to create_remote_file('/Users/afeefaz/Desktop/petclinic.jar') }
    end

    context 'When all attributes are default, on Ubuntu 20.04' do
        it { expect { chef_run }.to_not raise_error }
    end

    context 'creates a link with the default action' do
        it { is_expected.to create_link('/Users/afeefaz/Desktop/petclinic.jar') }
    end

    it 'creates a link to the specified target' do
        link = chef_run.link('/Users/afeefaz/Desktop/petclinic.jar')
        expect(link).to link_to('/etc/init.d/petclinic')
    end

    context 'enables petclinic service' do
        it { is_expected.to enable_service('petclinic') }
    end

    context 'enables petclinic service' do
        it { is_expected.to start_service('petclinic') }
    end
end