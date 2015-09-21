require 'twitter'
require 'dotenv'
Dotenv.load

#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_SECRET']
end

search_term = URI::encode('random')
tweet_count = 50

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}", result_type: 'recent').take(tweet_count)

    if tweets
      tweets.map! do |tweet|
        { name:           tweet.user.name,
          body:           tweet.text,
          avatar:         tweet.user.profile_image_url_https,
          created_at:     tweet.created_at,
          favorite_count: tweet.favorite_count,
          retweet_count:  tweet.retweet_count,
          media:          (tweet.attrs[:entities][:media].sample[:display_url] if tweet.attrs[:entities][:media]) }
      end
      send_event('synchro_twitter', tweets: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end