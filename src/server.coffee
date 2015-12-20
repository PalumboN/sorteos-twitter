express = require('express')
twitter = require('./twitter')

app = express()

port = process.env.PORT || 3000

app.get '/', (req, res) ->
  res.send twitter

app.listen port, ->
  console.log "Listen port #{port}"
