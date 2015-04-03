require 'twitter'

namespace :twitter do
  desc "tweet hello"
  task :tweet => :environment do
    CONSUMER_KEY = "jFB4VEVespxHwAq7TD5lulCrE"
    CONSUMER_SECRET = "pwd5dzxoy3crKdncAVsGGDpl4hgdY7cVm2HI8ZzWZukihftqhE"
    OAUTH_TOKEN = session[:oauth_token]
    OAUTH_TOKEN_SECRET = session[:oauth_token_secret]

    config = {
        :consumer_key    => CONSUMER_KEY,
        :consumer_secret => CONSUMER_SECRET,
        :oauth_token => OAUTH_TOKEN,
        :oauth_token_secret => OAUTH_TOKEN_SECRET
    }

    client = Twitter::REST::Client.new(config)
    tweet = "from service. this is test. "
    update(client, tweet)
  end
  def update(client, tweet)
    begin
      tweet = (tweet.length > 140) ? tweet[0..139].to_s : tweet
      client.update(tweet.chomp)
    rescue => e
      Rails.logger.error "<<twitter.rake::tweet.update ERROR : #{e.message}>>"
    end
  end
end