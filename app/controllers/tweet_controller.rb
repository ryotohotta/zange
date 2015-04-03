class TweetController < ApplicationController
  def input
  end
 
  def update
    if signed_in?
      client = Twitter::REST::Client.new do |config|
        config.consumer_key         = "jFB4VEVespxHwAq7TD5lulCrE"
        config.consumer_secret      = "pwd5dzxoy3crKdncAVsGGDpl4hgdY7cVm2HI8ZzWZukihftqhE"
        config.access_token         = session[:oauth_token]
        config.access_token_secret  = session[:oauth_token_secret]
      end
      client.update(params[:message])
      @result = :success
    else
      @result = :not_signed_in
    end
  end
end
