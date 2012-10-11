#
# lib/client/index.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
jquery = require 'jquery-browserify'




# Load our modules. If they're not loaded here, they will not be
# bundled by browserify.
io = require './io'
require './sandbox'



if document?
  jquery(document).ready ->
    io.connect()
    
    window.foop = require
    console.log "Sob.. #{require}"
    console.log "Sob.. #{require.main}"