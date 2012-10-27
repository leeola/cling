#
# lib/client/main.coffee
#
# This is a very bad module.
#
# Basically the whole module is being treated as an entry point, because
# Browserify currently does not give any indication to a module that it is
# being called directly.. that is to say, `require.main is module` is
# impossible at the moment. With that said, if this module is loaded, either
# by Browserify or in Nodejs via `require './main'`, this code will run.
#
# This can obviously have a negative impact if you import this module in
# Nodejs, such as via `require ./lib/client` for automated testing, and so
# this module is not included in ./index.coffee.
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