apt_update 'update_repo' do
  action :update
end

remote_file '/Users/afeefaz/Desktop/petclinic.jar' do
  source 'https://afeef-tc-petclinic.s3.us-east-2.amazonaws.com/spring-petclinic-2.4.2.jar'
  mode '0755'
  action :create
end

link '/Users/afeefaz/Desktop/petclinic.jar' do
  to '/etc/init.d/petclinic'
  action :create
end

service 'petclinic' do
  action :enable
end

service 'petclinic' do
  action :start
end