class CommentController < ApplicationController
  def show
  end
  
  def create
  end
  
  private
    def comment_params
      params.require(:users).permit(:name, :email, :password, :password_confirmation)
    end
end
