#
# lib/server/io.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
app = require './app'



io = (require 'socket.io').listen app.server
io.sockets.on 'connection', (socket) ->
  console.log 'Client connected.'
  socket.emit 'foo', hello: 'world'