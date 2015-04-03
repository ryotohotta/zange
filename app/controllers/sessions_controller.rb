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
    auth = request.env["omniauth.auth"]
    session[:oauth_token] = auth.credentials.token
    session[:oauth_token_secret] = auth.credentials.secret
    redirect_to current_user, :notice => "Signed in!"
  end

  def remove
    session[:oauth_token] = nil
    session[:oauth_token_secret] = nil
    redirect_to current_user, :notice => "Signed out!"
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
