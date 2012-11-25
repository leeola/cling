# 
# # App
# 
# Create or stop a specific instance of an app.
# 
http = require 'http'
https = require 'https'
express = require 'express'
config = (require './config').server
configure = require './configure'
route = require './route'




# A list of applications that this node instance has spun up.
apps = []


# # Start
# 
# Create, and start an application. The application is returned, and appended
# to our `apps` list.
start = (opts={}, callback) ->
  opts.https ?= config.https
  port = opts.port ?= config.port
  
  app = express()
  apps.push app
  
  app.set 'port', port
  
  #Note that we are currently ignoring async features here. This will need
  #to be fixed.
  configure app
  route app
  
  app.listen port, callback


# # Stop
# 
# Stop the supplied application. If no application is supplied, an application
# is popped off of our `apps` list, stopped, and returned.
stop = (app) ->
  if not app?
    app = apps.pop()
  
  if not app?
    throw new Error 'No application available to stop.'
  
  app.close()



exports.apps = apps
exports.start = start
exports.stop = stop