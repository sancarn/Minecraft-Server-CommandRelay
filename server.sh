#!/usr/bin/env bash
mkfifo mccommands.pipe
cat mccommands.pipe | java -jar minecraft_server-1.7.3.jar
ruby server.rb > mccommands.pipe
