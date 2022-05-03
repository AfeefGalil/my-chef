apt_update 'all platforms'

# aws_s3_file 'spring-petclinic-2.4.2.jar' do
#   bucket 'afeef-tc-petclinic'
#   remote_path '/'
#   region 'us-east-2'
#   aws_access_key 'AKIAWBJQK4DCL3VUIOML'
#   aws_secret_access_key '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'
#   action :create
# end

remote_file '/home/ubuntu' do
    source 'https://afeef-tc-petclinic.s3.us-east-2.amazonaws.com/spring-petclinic-2.4.2.jar'
    mode '0755'
    action :create
  end

execute 'run_jar' do
  command 'java -jar /home/ubuntu/petclinic.jar &'
  action :run
end