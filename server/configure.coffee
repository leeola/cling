# 
# # App Configure
# 
# Configure the app with settings and middleware.
# 
http = require 'http'
path = require 'path'
express = require 'express'
browserify = require 'browserify'




# # Configure
# 
# The exposed configure function.
configure = (app) ->
  
  
  # ## Listen and Close
  # 
  # We're creating our own listen and close methods because Express3+ does
  # not have a way to close a server on the `app` object. So, we create one.
  server = undefined
  app.listen = ->
    server = http.createServer this
    server.listen arguments...
  
  app.close = ->
    server.close()
  
  
  app.use express.logger()
  
  app.use express.bodyParser()
  
  
  # ## Browserify & CoffeeScript
  # 
  # To attempt and keep coffee/js compatibility, we are going to use the
  # current file extension. This way if *this* file is a coffee file, it will
  # try and load `../client/main.coffee` and if this is a js file, it will
  # try and load `../client/main.js`
  app.use browserify "#{__dirname}/../client/main#{path.extname __filename}",
    cache: "#{__dirname}/../.browserify_cache.json"
    verbose: true




module.exports = configure