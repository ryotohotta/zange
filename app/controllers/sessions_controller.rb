class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email = params_user[:email]
    password = params_user[:password]

    if login(email, password)
      redirect_to articles_url, notice: "サインインしました"
    else
      @user = User.new(email: email)
      render :new
    end
  end

  def callback
    auth = request.env['omniauth.auth']

    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
     # sessionに保持するように変更
    session[:user_id] = auth['uid']
    session[:name] = auth['info']['name']
    #投稿に必要なauth_token, secret_tokenを取得
    session[:oauth_token] = auth['credentials']['token']
    session[:oauth_token_secret] = auth['credentials']['secret']
  end

  def destroy
    logout
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def params_user
    params.require(:user).permit(:email, :password)
  end
end
