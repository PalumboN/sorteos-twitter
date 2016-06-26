module.exports =
  port: process.env.PORT || 3000
  mongo:
    uri: process.env.MONGO_URI or 'mongodb://localhost:27017/sorteo-wimbledon-test'
  twitter:
    credentials:
      consumer_key : process.env.TWITTER_CONSUMER_KEY
      consumer_secret : process.env.TWITTER_CONSUMER_SECRET
      access_token_key : process.env.TWITTER_TOKEN_KEY
      access_token_secret : process.env.TWITTER_TOKEN_SECRET
    search: process.env.SEARCH or '#LaWimbledon'
