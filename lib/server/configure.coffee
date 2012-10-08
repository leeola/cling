#
# lib/server/configure.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
path = require 'path'
flatiron = require 'flatiron'
browserify = require 'browserify'
app = require './app'




# Use the default http plugin.
app.use flatiron.plugins.http

# Set up the app to use winston logging.
app.use flatiron.plugins.log

# Log all connections
app.http.before.push (req, res, next) ->
  app.log.debug "#{req.connection.remoteAddress} "+
    "[#{(new Date()).toUTCString()}] "+
    "#{req.method} "+
    "#{req.url} "+
    "#{req.headers['user-agent']}"
  next()


# To attempt and keep coffee/js compatibility, we are going to use the
# current file extension. This way if *this* file is a coffee file, it will
# try and load `../client/index.coffee` and if this is a js file, it will try
# and load `../client/index.js`
app.http.before.push browserify "#{__dirname}/../client/index#{path.extname __filename}",
  cache: "#{__dirname}/../../.browserify_cache.json"
  verbose: true