#
# lib/server/main.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
winston = require 'winston'
config = (require '../config').server
app = require './app'




end = ->
  app.server.close()


# (port) -> undefined
#
# Params:
#   port: The port the web server is going to listen on.
#
# Desc:
#   Start the web server.
start = (port=config.port, callback=->) ->
  winston.info "Monitoring connections on port:#{port}"
  app.start port, callback
  
  
  # We're setting up io *after* the app is started, because socket.io needs
  # that.
  require './io'




exports.end = end
exports.start = start