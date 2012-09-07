#
# lib/client/index.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#



console.log 'Hello Client'



io = require 'socket.io-client'
socket = io.connect()
socket.on 'foo', (data) ->
  console.log 'foo recieved!'
