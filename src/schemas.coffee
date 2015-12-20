mongoose = require('mongoose')
mongoose.connect('mongodb://localhost:27017/sorteo-wimbledon-test');

Schema = mongoose.Schema
Mixed = Schema.Types.Mixed

Tweet = new Schema
  created_at: Mixed
  text: String
  user: Mixed

module.exports = mongoose.model 'Tweet', Tweet
