#
# test/api/tests.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
dork = require 'dork'
should = require 'should'
require '../options'




request = (options={}, callback) ->
  #options.host ?= 'cling.leeolayvar.c9.io'
  #options.port ?= 80
  options.host ?= 'localhost'
  options.port ?= 3003
  options.path ?= '/'
  options.method ?= 'GET'
  options.headers ?= {}
  
  
  http = require 'http'
  
  # This is the actual opts object that we are passing to the request
  opts =
    host: options.host
    port: options.port
    headers: options.headers
  
  req = http.request options, (res) ->
    
    data = ''
    res.setEncoding 'utf-8'
    
    res.on 'data', (chunk) ->
      data += chunk
    
    res.on 'end', () ->
      # Parse our data..
      callback null, res, data
    
    res.on 'error', (error) ->
      callback error, res, data
  
  #if options.data?
  #  req.write JSON.stringify data
  req.end JSON.stringify options.data



describe 'Test Submission', ->
  server = undefined
  
  before_all (done) ->
    server = require '../../lib/server'
    server.main.start undefined, done
  
  before_each ->
    opts =
      #host: 'cling.leeolayvar.c9.io'
      #port: 80
      host: 'localhost'
      port: 3003
      headers: {}
  
  it 'should accept any code', (done) ->
    request
      path: '/api/tests'
      method: 'POST'
      headers:
        'Content-Type': 'application/json'
      data:
        foo: 'bar'
      
      (err, res, data) ->
        data = JSON.parse data
        
        res.statusCode.should.equal 200
        data.should.eql hello: 'world'
        
        done()
  
  after_all ->
    server.main.end()




if require.main is module then dork.run()