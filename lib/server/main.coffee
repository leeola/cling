#
# lib/server/main.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
winston = require 'winston'
config = (require '../config').server
app = require './app'




# (port) -> undefined
#
# Params:
#   port: The port the web server is going to listen on.
#
# Desc:
#   Start the web server.
start = (port=config.port) ->
  winston.info "Monitoring connections on port:#{port}"
  app.start port
  
  
  # We're setting up io *after* the app is started, because socket.io needs
  # that.
  require './io'




exports.start = start