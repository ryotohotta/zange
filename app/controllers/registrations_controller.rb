class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    
    if @user.save
      auto_login(@user)
      login(@user.email, @user.password)
      redirect_to articles_url, notice: "サインインしました"
    else
      render :new
    end
  end

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
