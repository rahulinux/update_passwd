#!/usr/bin/env bash

# Change Password of Remote Server Using SSH

#--------------------------------------------
# Define User which you want to
# Change Password in remote server
#--------------------------------------------
Uname="root"
# Create Password in Encrpyted Form Using below command,
# and store in this script
# perl -e'print crypt("YourPassword", "salt")' ; echo -e
# then copy and past in following varible,
# password should be single qouted*

Password='safv8d8ESMmWk'

Update_Pass() {
  ssh $ruser@$Server_ip  -p $port "echo ${Uname}:${Password} | chpasswd -e"
}

Show_Help(){
cat <<_EOF
Usage $0        [OPTION]..
Mandatory arguments to long options are mandatory for short options too.
  -i, --ip     <IP_ADDR_OF_SREVER> IP Address Of Remote Server
  -u, --user   <Username>          Username Of Remote Server    <Default User is root>
  -p, --port   <port>              Port Of Remote Server        <Default is 22>

Note:- For Security Reason Do Not Provide Password to the script, because
       it will get save in history, so do not provide it,
       script will prompt for password

Report $0 bugs to loginrahul90@gmail.com
_EOF
}



Main() {

        case $1 in
           -i|--ip) Server_ip=$2;
                    ruser="$4"; [[ -z $ruser ]] && ruser=root
                    port="$6";  [[ -z $port  ]]  && port=22
                    Update_Pass ;;
                *)  Show_Help ;;
        esac
}

Main $*
