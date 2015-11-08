class PostsController < ApplicationController
  def index
    @post = Post.all
  end
    
  def new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end
  
  private
    def post_params
      params.require(:posts).permit(:link)
    end
end
