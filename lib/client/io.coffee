#
# lib/client/io.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
jquery = require 'jquery-browserify'
io = require 'socket.io-client'




connect = ->
  jquery('#status .value').text 'connecting..'
  
  # Grab our connection object.
  socket = io.connect()
  window.soc = socket
  
  socket.on 'connect', ->
    jquery('#status .value').text 'connected'
  
  socket.on 'disconnect', ->
    jquery('#status .value').text 'disconnected'




exports.connect = connect