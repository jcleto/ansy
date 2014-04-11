# /etc/init.d/activemq
#
# Startup script for activemq
# 
# chkconfig: 2345 20 80
# description: Starts and Stops activemq
. /etc/init.d/functions

desc="ActiveMQ messaging system."
ACTIVEMQ_HOME=/opt/activemq
#source /etc/activemq/activemq-env.sh

start() {
  echo "Starting $desc (activemq): "
  $ACTIVEMQ_HOME/bin/activemq start
  RETVAL=$?
  return $RETVAL
}

stop() {
  echo "Shutting down $desc (activemq): "
  $ACTIVEMQ_HOME/bin/activemq stop
  RETVAL=$?
  return $RETVAL
}

restart() {
    stop
    start
}

status() {
  $ACTIVEMQ_HOME/bin/activemq status
  RETVAL=$?
  return $RETVAL
}

case "$1" in

  start)   start;;
  stop)    stop;;
  restart) restart;;
  status)  status;;
  *)       echo "Usage: $0 {start|stop|restart|flush-restart|status}"
           RETVAL=2;;
esac
exit $RETVAL
