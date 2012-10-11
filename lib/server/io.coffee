#
# lib/server/io.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
io = require 'socket.io'
app = require './app'




ios = io.listen app.server
ios.set 'log level', 2

ios.sockets.on 'connection', (socket) ->
  console.log 'Client connected.'

ios.sockets.on 'disconnect', (socket) ->
  console.log 'Client disconnected.'