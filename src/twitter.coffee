oauthSignature = require('oauth-signature')
Promise = require('bluebird')
request = Promise.promisifyAll require('request')
crypto = require('crypto-js')
moment = require('moment')
#Tweet = require('./schemas')
_ = require('lodash')

Twitter = require('twitter');

client = new Twitter
  consumer_key : "8f0uhDIOjwpwZev4vi0r9EF4s"
  consumer_secret : "43be9eMMvNMn31On4FjltLXihH5lwcFzql5XgGvRlqaEZrJCE6"
  access_token_secret : "MT9CewA17OkH5hXuMXGwG9ENvrrRBHukt4Cisy2byVK54"
  access_token_key : "187098812-8TENqL5JiDCDvJHflxtltHi70DNrUguIbsW06Zwv"


tweets = []

track = process.env.SEARCH "#LaWimbledon"

console.log "Searching " + track

client.stream 'statuses/filter', { track: track }, (stream) =>
  stream.on 'data', (tweet) =>
    #new Tweet(tweet).save()
    tweets.push tweet
    console.log toDto tweet

toDto = (tweet) ->
  message: tweet.text
  user:
    name: tweet.user.name
    nick: tweet.user.screen_name
  channel: "Tweeter"
  created: tweet.created_at

module.exports =
  tweets: => tweets.map toDto
