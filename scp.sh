#!/bin/bash
source config.cfg
/usr/bin/expect <<EOD
spawn scp $FILE $USER@$IP:/root/
#######################
expect {
-re ".*es.*o.*" {
exp_send "yes\r"
exp_continue
}
-re ".*sword.*" {
exp_send "$PASS\r"
}
}
expect eof
EOD
