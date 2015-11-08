class PostsController < ApplicationController
  def index
    @post = Post.all
  end
    
  def new
  end
  
  def create
    @post = Post.create(post_params)
    if @post
      redirect_to root_url
    else
      render new_url
    end
  end
  
  private
    def post_params
      params.require(:posts).permit(:link)
    end
end
