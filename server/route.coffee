# 
# # App Router
# 
# Route incoming connections to the app based on the rules laid out in this
# module.
#
app = require './app'
views = (require './views').load()




# Our browser client home.
app.router.get '/', () ->
  @res.writeHead 200,
    'Content-Type': 'text/html'
  @res.end views.base


app.router.get '/api', ->
  @res.writeHead 200,
    'Content-Type': 'text/plain'
  @res.end 'API Stuffs'


app.router.get '/api/clients', ->
  @res.writeHead 200,
    'Content-Type': 'text/plain'
  @res.end JSON.stringify {}


app.router.get '/api/history', ->
  @res.writeHead 200,
    'Content-Type': 'text/plain'
  @res.end JSON.stringify {}


app.router.get '/api/tests', ->
  @res.writeHead 200,
    'Content-Type': 'text/plain'
  @res.end JSON.stringify {}


app.router.post '/api/tests', ->
  body = @req.body
  
  # Required
  if not body.source?
    @res.writeHead 400,
      'Content-Type': 'text/plain'
    @res.end 'Missing required argument "source".'
    return
  
  # Do some lib work here to queue the test
  rdata = {}
  
  @res.writeHead 200,
    'Content-Type': 'application/json'
  @res.end JSON.stringify rdata
