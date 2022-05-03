apt_update 'all platforms'

remote_file '/home/ubuntu' do
    source 'https://afeef-tc-petclinic.s3.us-east-2.amazonaws.com/spring-petclinic-2.4.2.jar'
    mode '0755'
    action :create
  end

execute 'run_jar' do
  command 'java -jar /home/ubuntu/petclinic.jar &'
  action :run
end