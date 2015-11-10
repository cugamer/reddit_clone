class CommentController < ApplicationController
  def show
  end
  
  def create
  end
  
  private
    def comment_params
      params.require(:comments).permit(:comment_body)
    end
end
