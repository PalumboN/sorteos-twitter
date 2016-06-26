_ = require('lodash')
express = require('express')
twitter = require('./twitter')
config = require('./config')
app = express()

port = config.port

app.get '/', (req, res) ->
  twitter.tweets()
  .then (tweets) ->
    res.send tweets

app.get '/random', (req, res) ->
  twitter.tweets()
  .then (tweets) ->
    res.send _.sample tweets


app.listen port, ->
  console.log "Listen port #{port}"
