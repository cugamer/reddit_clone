class UsersController < ApplicationController
  def new
    p "-------------------new called----------------------"
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      redirect_to new_user_path
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:users).permit(:name, :email, :password, :password_confirmation)
    end
end
