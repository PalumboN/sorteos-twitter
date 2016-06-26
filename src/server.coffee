_ = require('lodash')
express = require('express')
twitter = require('./twitter')
config = require('./config')
app = express()

port = config.port


app.get '/', (req, res) ->
  res.send twitter.tweets()

app.get '/random', (req, res) ->
  res.send _.sample twitter.tweets()


app.listen port, ->
  console.log "Listen port #{port}"
