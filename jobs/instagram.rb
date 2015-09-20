require 'instagram'
require 'dotenv'
Dotenv.load

Instagram.configure do |config|
  config.client_id = ENV['CLIENT_ID']
  config.client_secret = ENV['CLIENT_SECRET']
  config.access_token = ENV['ACCESS_COIN']
end

SCHEDULER.every '30m', :first_in => 0 do |job|
  begin
    media_feed = Instagram.media_popular

    if media_feed
      media_feed.map! do |media|
        { photo: media.images.standard_resolution.url }
      end
      send_event('synchro_instagram', photos: media_feed)
    end
  rescue Instagram::Error
    puts "\e[33mFor the Instagram widget to work, you need to put in your Instagram API keys in the jobs/instagram.rb file.\e[0m"
  end
end