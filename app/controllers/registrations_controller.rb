class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    
    if @user.save
      login(@user.email, @user.password)
      redirect_to root_url
    else
      render :new
    end
  end

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end