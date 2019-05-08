#!/usr/bin/env bash

function checkSupportOS() {
  logTip $FUNCNAME
  if [ -z $(egrep -i 'CentOS|Red Hat' /etc/redhat-release) ]; then
    logFail 'Only support CentOS or Redhat system.'
    exit 1
  fi
  if [ $(uname -i) != "x86_64" ]; then
    logFail "Only support 64bit Operating System."
    exit 1
  fi
}
function checkPrivilege() {
  logTip $FUNCNAME
  if [ $(whoami) != "root" ]; then
    logFail " Only root can run it. "
    exit 1
  fi
}
function checkNetwork() {
  logTip $FUNCNAME
  ping www.baidu.com -c 2 &>/dev/null
  if [ $? -ne 0 ]; then
    logFail "Network connection failed."
    exit 1
  fi
}

main() {
  checkSupportOS
  checkPrivilege
  checkNetwork
  cat <<EOF
+-------------------------------------------------+
|               check is done                     |
+-------------------------------------------------+
EOF
}

main