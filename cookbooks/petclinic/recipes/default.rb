apt_update 'update_repo' do
  action :update
end

remote_file '/home/ubuntu/petclinic.jar' do
  source 'https://afeef-tc-petclinic.s3.us-east-2.amazonaws.com/spring-petclinic-2.4.2.jar'
  mode '0755'
  action :create
end

remote_file '/etc/systemd/system/petclinic.service' do
  source 'https://afeef-tc-petclinic.s3.us-east-2.amazonaws.com/petclinic.service'
  mode '0755'
  action :create
end

remote_file '/home/ubuntu/petclinic.sh' do
  source 'https://afeef-tc-petclinic.s3.us-east-2.amazonaws.com/petclinic.sh'
  mode '0755'
  action :create
end

service 'petclinic' do
  action :enable
end

service 'petclinic' do
  action :start
end