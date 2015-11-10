class CommentController < ApplicationController
  def show
  end
  
  def create
    comment = Comment.new(comment_params)
    p "------------------------#{comment_params}------------------------------"
    p comment_params[:id]
    if comment.save
      flash[:success] = "Comment posted"
    else
      flash[:danger] = "Comment not posted"
    end
    redirect_to post_path(3)
  end
  
  private
    def comment_params
      params.require(:comments).permit(:comment_text, :post_id)
    end
end
