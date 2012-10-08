#
# lib/server/route.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
app = require './app'
views = require './views'




# Our client connects.
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
  
  # Check to ensure the test submission has valid context.
  
  @res.writeHead 200,
    'Content-Type': 'text/plain'
  @res.end 'Submitting a new test..'
