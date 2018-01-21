class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :destroy]

  before_action only: [:edit, :update, :destroy, :new, :create] do 
    require_admin_user(root_path)
  end

  def home
    @posts = Post.first(2)
  end
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def edit
    
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created successfully"
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "Post updated successfully"
      redirect_to posts_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:post_text, :title, :picture_id, :picture_url, picture_attributes: [:id])
    end
   
    def set_post
      @post = Post.find(params[:id])
    end
end

