# 
# # App Router
# 
# Route incoming connections to the app based on the rules laid out in this
# module.
# 
# Note that this API has no version indicator. Since this is just intended to
# be run locally, breaking compatability is not an issue that should fall
# upon the API, but rather the Cling package version itself.
# 
# Don't update it, and your API won't change, magic!
# 
views = (require './views').load()




# # Route
# 
# The route function is exposed as the module itself. It takes an app, and
# applies routes to said app.
route = (app) ->
  
  # ## Client Side
  
  
  # This is the only non-API interface exposed for Cling. This is just an
  # index page which holds a users connection and relays API-events to the
  # client.
  app.get '/', (req, res) ->
    res.writeHead 200,
      'Content-Type': 'text/plain'
    res.end "Hello"
  
  
  
  
  # ## API Side
  
  
  # ### Client List
  # 
  # A list of API client IDs actively connected..
  # 
  # #### URI
  #     GET /api/clients
  # 
  # #### Response
  #     {
  #       "clients": [
  #         0,
  #         1,
  #         2
  #         /* ... */
  #         ]
  #     }
  app.get '/api/clients', (req, res) ->
    res.writeHead 501
    res.end()
  
  
  # ### Client Information
  # 
  # Information about a specific client.
  # 
  # #### URI
  #     GET /api/client/:id
  # 
  # #### Response:
  #     {
  #       "name": "Internet Explorer",
  #       "version": "0.9",
  #       "connected": false,
  #       "state: "running"
  #     }
  app.get '/api/client/:id', (req, res) ->
    res.writeHead 501
    res.end()
  
  
  
  app.get '/api/history', (req, res) ->
    res.writeHead 501
    res.end()
  
  
  app.get '/api/tests', (req, res) ->
    res.writeHead 501
    res.end()
  
  
  # 
  app.post '/api/tests', (req, res) ->
    body = req.body
    
    # Required
    if not body.source?
      res.writeHead 400,
        'Content-Type': 'text/plain'
      res.end 'Missing required argument "source".'
      return
    
    # Do some lib work here to queue the test
    rdata = {}
    
    res.writeHead 200,
      'Content-Type': 'application/json'
    res.end JSON.stringify rdata




module.exports = route