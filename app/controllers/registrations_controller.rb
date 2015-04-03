class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    
    # auth = request.env['omniauth.auth']

    # user = User.find_by_provider_and_id(auth['provider'], auth['uid'])
    # user ||= User.create_with_omniauth(auth)
    #  # sessionに保持するように変更
    # session[:user_id] = auth['uid']
    # session[:name] = auth['info']['name']
    # #投稿に必要なauth_token, secret_tokenを取得
    # session[:oauth_token] = auth['credentials']['token']
    # session[:oauth_token_secret] = auth['credentials']['secret']
    
    if @user.save
      login(@user.email, @user.password)
      redirect_to new_sessions_path, notice: "サインインしました"
    else
      render :new
    end
  end

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
