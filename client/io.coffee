# 
# # Socket IO
# 
# The client side Socket IO code.
# 




connect = ->
  jquery = require 'jquery-browserify'
  io = require 'socket.io-client'

  jquery('#status .value').text 'connecting..'
  
  # Grab our connection object.
  socket = io.connect()
  window.soc = socket
  
  socket.on 'connect', ->
    jquery('#status .value').text 'connected'
  
  socket.on 'disconnect', ->
    jquery('#status .value').text 'disconnected'




exports.connect = connect