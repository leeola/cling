# 
# # Socket.IO Server
# 
# Load socket.io and start the io server. This module structure needs
# reformatting.
# 
io = require 'socket.io'
app = require './app'




ios = io.listen app.server
ios.set 'log level', 2

ios.sockets.on 'connection', (socket) ->
  console.log 'Client connected.'

ios.sockets.on 'disconnect', (socket) ->
  console.log 'Client disconnected.'



exports.ios = ios