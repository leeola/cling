# 
# # App Storage
# 
# A simple app reuse module.
# 
flatiron = require 'flatiron'




# Create the app, and expose it.
exports = module.exports = flatiron.app


# Now call our configure/route modules so that they can set up this app.
require './configure'
require './route'