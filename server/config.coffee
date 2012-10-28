# 
# # Default Config
# 
# The default config for this app.
# 
# **Note:** This should *not* be changed by the user.
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