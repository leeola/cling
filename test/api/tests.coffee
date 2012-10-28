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
  options.host ?= 'localhost'
  options.port ?= if not process.env.C9_PORT? then 3003 else process.env.C9_PORT
  options.path ?= '/'
  options.method ?= 'GET'
  options.headers ?= {}
  options.headers.Connection ?= 'close'
  
  http = require 'http'
  req = http.request options, (res) ->
    data = ''
    res.setEncoding 'utf-8'
    res.on 'data', (chunk) ->
      data += chunk
    res.on 'end', () ->
      callback null, res, data
    res.on 'error', (error) ->
      callback error, res, data
  req.end JSON.stringify options.data



describe 'Test Submission', ->
  server = undefined
  
  
  before_all (done) ->
    server = require '../../server'
    server.main.start undefined, done
  
  
  it 'should accept source', (done) ->
    
    request
      path: '/api/tests'
      method: 'POST'
      headers:
        'Content-Type': 'application/json'
      data:
        source: 'foo'
      
      (err, res, data) ->
        data = JSON.parse data
        
        res.statusCode.should.equal 200
        data.should.eql id: 1
        
        done()
  
  
  it 'should fail with badly formatted requests', (done) ->
    
    request
      path: '/api/tests'
      method: 'POST'
      headers:
        'Content-Type': 'application/json'
      data: {}
      
      (err, res, data) ->
        if err then throw err
        
        res.statusCode.should.equal 400
        data.should.equal 'Missing required argument "source".'
        
        done()
  
  
  
  after_all ->
    server.main.end()
  




if require.main is module then dork.run()