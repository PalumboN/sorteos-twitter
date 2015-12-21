express = require('express')
twitter = require('./twitter')
_ = require('lodash')

app = express()

port = process.env.PORT || 3000

app.get '/', (req, res) ->
  res.send twitter.tweets()

app.get '/random', (req, res) ->
  res.send _.sample twitter.tweets()


app.listen port, ->
  console.log "Listen port #{port}"
