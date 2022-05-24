apt_update 'update_repo' do
  action :update
end

aws_s3_file '/home/ubuntu/petclinic.jar' do
  bucket 'afeef-tc-petclinic'
  remote_path node['artifact']
  region 'us-east-2'
  action :create
end

file '/home/ubuntu/petclinic.jar' do
  mode '0755'
  action :create
end

aws_s3_file '/etc/systemd/system/petclinic.service' do
  bucket 'afeef-tc-petclinic'
  remote_path 'petclinic.service'
  region 'us-east-2'
  action :create
end

file '/etc/systemd/system/petclinic.service' do
  mode '0755'
  action :create
end

aws_s3_file '/home/ubuntu/application.properties' do
  bucket 'afeef-tc-petclinic'
  remote_path 'application.properties'
  region 'us-east-2'
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