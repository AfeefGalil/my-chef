apt_update 'update_repo' do
  action :update
end

aws_s3_file '/home/ubuntu/petclinic.jar' do
  bucket node['petclinic']['aws_bucket_name']
  remote_path 'petclinic.jar'
  region node['petclinic']['aws_region']
  action :create
end

file '/home/ubuntu/petclinic.jar' do
  mode '0755'
  action :create
end

aws_s3_file '/etc/systemd/system/petclinic.service' do
  bucket node['petclinic']['aws_bucket_name']
  remote_path 'petclinic.service'
  region node['petclinic']['aws_region']
  action :create
end

file '/etc/systemd/system/petclinic.service' do
  mode '0755'
  action :create
end

aws_s3_file '/home/ubuntu/application.properties' do
  bucket node['petclinic']['aws_bucket_name']
  remote_path 'application.properties'
  region node['petclinic']['aws_region']
  action :create
end

file '/home/ubuntu/application.properties' do
  mode '0755'
  action :create
end

service 'petclinic' do
  action :enable
end

service 'petclinic' do
  action :start
end