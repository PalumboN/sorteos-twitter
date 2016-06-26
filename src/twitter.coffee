_ = require('lodash')
Tweet = require('./schemas')
config = require('./config').twitter
Twitter = require('twitter')

track = config.search
console.log "Searching " + track

client = new Twitter config.credentials
client.stream 'statuses/filter', { track: track }, (stream) =>
  stream.on 'data', (tweet) =>
    Tweet.create(tweet)
    console.log toDto tweet

toDto = (tweet) ->
  message: tweet.text
  user:
    name: tweet.user.name
    nick: tweet.user.screen_name
  channel: "Tweeter"
  created: tweet.created_at

module.exports =
  tweets: => Tweet.find()
