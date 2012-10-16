#
# test/api/tests.coffee
#
# Copyright (c) 2012 Lee Olayvar <leeolayvar@gmail.com>
# MIT Licensed
#
dork = require 'dork'
should = require 'should'
require '../options'




describe 'Test Submission', ->
  server = undefined
  
  before_all (done) ->
    server = require '../../lib/server'
    server.main.start undefined, done
  
  it 'should something', (done) ->
    
    http = require 'http'
    opts =
      #host: 'cling.leeolayvar.c9.io'
      #port: 80
      host: 'localhost'
      port: 3003
      path: '/'
      method: 'GET'
    
    req = http.request opts, (res) ->
      console.log "Status: #{res.statusCode}"
      console.log "Headers: #{JSON.stringify res.headers}"
      
      res.setEncoding 'utf-8'
      res.on 'data', (chunk) ->
        console.log chunk
      
      res.on 'end', () ->
        done()
      
      res.on 'error', (error) ->
        throw error
    
    req.end()
  
  after_all () ->
    server.main.end()




if require.main is module then dork.run()