class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def index
    @post = Post.all
  end
  
  def show
    @user_email = User.find_by(id: current_user.id).email
    @post = Post.find(params[:id])
  end
    
  def new
  end
  
  def create
    user = User.find_by(id: current_user.id)
    @post = user.posts.build(post_params)
    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end
  
  private
    def post_params
      params.require(:posts).permit(:link, :descriptive_text)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in to post."
        redirect_to login_url
      end
    end
end
