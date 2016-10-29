_ = require('lodash')
express = require('express')
twitter = require('./twitter')
config = require('./config')
app = express()

port = config.port

tweets = ->
  twitter.tweets()
  .then (it) -> it.map toDTO

toDTO = ({created_at:hora, user: {screen_name:usuario}, text:mensaje}) ->
  {hora, usuario, mensaje}

# ------------------------------------------------

app.get '/', (req, res) ->
  tweets()
  .then (tweets) ->
    res.send tweets

app.get '/random', (req, res) ->
  tweets()
  .then (tweets) ->
    res.send _.sample tweets


app.listen port, ->
  console.log "Listen port #{port}"
