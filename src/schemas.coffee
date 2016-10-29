config = require('./config').mongo
mongoose = require('mongoose')
mongoose.connect(config.uri)
mongoose.Promise = require('bluebird')

Schema = mongoose.Schema
Mixed = Schema.Types.Mixed

Tweet = new Schema
  created_at: Mixed
  id: Mixed
  text: Mixed
  source: Mixed
  user: Mixed
  geo: Mixed
  coordinates: Mixed
  place: Mixed
  contributors: Mixed
  is_quote_status: Mixed
  retweet_count: Mixed
  favorite_count: Mixed
  entities: Mixed
  filter_level: Mixed
  lang: Mixed


module.exports = mongoose.model 'Tweet', Tweet
