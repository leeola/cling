#
# bin/node/bin.coffee
#
# The node command line entry point.
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
fs = require 'fs'
path = require 'path'
nomnom = require 'nomnom'
resolve = require 'resolve'



# A node version fix.
if path.existsSync?
  existsSync = path.existsSync
else
  existsSync = fs.existsSync




nomnom.script 'cling'
nomnom.help 'Start the cling server.'
nomnom.options
  location:
    abbr: 'l'
    metavar: 'LOCATION'
    help: 'Specify a hostname for cling to listen on.'
  
  port:
    abbr: 'p'
    metavar: 'PORT'
    help: 'Specify a port for cling to listen on.'



# ([input]) -> undefined
#
# Params:
#   input: Optional. A list of values to parse *in place of* process.argv.
#
# Desc:
#   Execute a dork test based on the arguments provided by either
#   `process.argv` or the `input` argument.
exec = (input) ->
  # Parse the opts, with a possible input override.
  opts = nomnom.parse input
  
  console.log "Not implemented."




exports.exec = exec