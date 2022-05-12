apt_update 'update_repo' do
  action :update
end

remote_file '/home/ubuntu/petclinic.jar' do
  source 'https://afeef-tc-petclinic.s3.us-east-2.amazonaws.com/spring-petclinic-2.4.2.jar'
  mode '0755'
  action :create
end

file '/etc/systemd/system/petclinic.service' do
  content "
[Unit]
Description = Training Petclinic Java Service
After=network-online.target
Wants=network-online.target
[Service]
Type = forking
Restart=always
RestartSec=5
SuccessExitStatus=143
ExecStart = /home/ubuntu/petclinic.sh start
ExecStop = /home/ubuntu/petclinic.sh stop
ExecReload = /home/ubuntu/petclinic.sh reload
[Install]
WantedBy=multi-user.target
  "
  action :create
end

file '/home/ubuntu/petclinic.sh' do
  content "
#!/bin/sh
SERVICE_NAME=petclinic
PATH_TO_JAR=/home/ubuntu/petclinic.jar
PID_PATH_NAME=/tmp/petclinic-pid
case $1 in
start)
  echo 'Starting $SERVICE_NAME ...'
if [ ! -f $PID_PATH_NAME ]; then
  nohup java -jar $PATH_TO_JAR --spring.profiles.active=mysql /tmp 2>> /dev/null >>/dev/null &
              echo $! > $PID_PATH_NAME
  echo '$SERVICE_NAME started ...'
else
  echo '$SERVICE_NAME is already running ...'
fi
;;
stop)
if [ -f $PID_PATH_NAME ]; then
    PID=$(cat $PID_PATH_NAME);
    echo '$SERVICE_NAME stoping ...'
    kill $PID;
    echo '$SERVICE_NAME stopped ...'
    rm $PID_PATH_NAME
else
    echo '$SERVICE_NAME is not running ...'
fi
;;
restart)
if [ -f $PID_PATH_NAME ]; then
  PID=$(cat $PID_PATH_NAME);
  echo '$SERVICE_NAME stopping ...';
  kill $PID;
  echo '$SERVICE_NAME stopped ...';
  rm $PID_PATH_NAME
  echo '$SERVICE_NAME starting ...'
  nohup java -jar $PATH_TO_JAR --spring.profiles.active=mysql /tmp 2>> /dev/null >> /dev/null &
  echo $! > $PID_PATH_NAME
  echo '$SERVICE_NAME started ...'
else
  echo '$SERVICE_NAME is not running ...'
fi     ;;
esac
  "
  action :create
end

service 'petclinic' do
  action :enable
end

service 'petclinic' do
  action :start
end