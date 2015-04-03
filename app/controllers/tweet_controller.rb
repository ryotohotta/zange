class TweetController < ApplicationController
  def input
  end
 
  def update
    if signed_in?
      client = Twitter::REST::Client.new do |config|
        config.consumer_key         = "Qndxjz83ZuZHwm7LoN9VX0wzC"
        config.consumer_secret      = "BmrtnW4g97au2Zn3TFPZKH09oyZjFOIOCmco0j7PY5JUikk43e"
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
