class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      flash[:errors] = "something wrong"
      flash[:successes] = "something good"
      render :new
    end
  end
  
  private
    def user_params
      params.require(:users).permit(:name, :email, :password, :password_confirmation)
    end
end
