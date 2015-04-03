class TweetController < ApplicationController
  def input
  end
 
  def update
    if signed_in?
      client = Twitter::REST::Client.new do |config|
        config.consumer_key         = "IttJRoF9wqVKXPrzsEeoDK2fZ"
        config.consumer_secret      = "DsMnQPNyfZoBi3z3rXMOFNoBII8imZjwztkGAoMFQyiAOqqYXP"
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
