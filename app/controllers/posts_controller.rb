class PostsController < ApplicationController
  def index
    @post = Post.all
  end
    
  def new
  end
  
  def create
    # render plain: params[:posts].inspect
    # p "-------------------params ----------------------"
    # p params
    @post = Post.new(post_params)
    @post.save
    redirect_to root_url
  end
  
  private
    def post_params
      params.require(:posts).permit(:link)
    end
end
