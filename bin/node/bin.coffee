# 
# # Node CLI-API
# 
# This file exposes the CLI-API, which is the single function `exec()`.
# For further explanation, see the `exec()` documentation below.
# 
fs = require 'fs'
path = require 'path'
nomnom = require 'nomnom'
server = require '../../server'



# A node version regression fix.
if path.existsSync?
  existsSync = path.existsSync
else
  existsSync = fs.existsSync



# ## CLI Options
# 
# **Note:** In near future, this will hopefully be replaced with a
# sister-project
nomnom.script 'cling'
nomnom.help 'Start the cling server.'
nomnom.options
  location:
    default: 'localhost'
    abbr: 'l'
    metavar: 'LOCATION'
    help: 'Specify a hostname for cling to listen on.'
  
  port:
    default: 3003
    abbr: 'p'
    metavar: 'PORT'
    help: 'Specify a port for cling to listen on.'



# ## CLI Interface
# 
# Start cling based on the arguments provided by either `process.argv`
# or the `input` argument.
# 
# **Note:** This function will be rewritten with a CLI option parser soon,
# allowing this to accept and return predictable input.
# 
# ([input]) -> undefined
# 
# - Params
#   - input: Optional. A list of values to parse *in place of* process.argv.
exec = (input) ->
  opts = nomnom.parse input
  
  server.app.start(opts)



exports.exec = exec