#!/usr/bin/env bash
mkfifo mccommands.pipe
cat /tmp/mccommands.pipe | java -jar minecraft_server-1.7.3.jar
ruby server.rb > /tmp/mccommands.pipe
