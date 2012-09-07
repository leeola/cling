#
# lib/config.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
path = require 'path'




# Default CLI specific options.
cli =
  daemon: false

# Default web config
server =
  port: if process.env.PORT? then process.env.PORT else 3003




exports.cli = cli
exports.server = server