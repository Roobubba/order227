class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :destroy, :show]
  before_action only: [:edit, :update, :destroy, :new, :create] do 
    require_admin_user(root_path)
  end

  def home
    @posts = Post.pinned.paginate(page: params[:page], per_page: 5)
  end
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def edit
    
  end
  
  def show
  
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      if @post.fb_post == 1
        message = post_to_fb(@post) 
        if message == 'Article Posted'
          message = " and posted to Facebook"
          @post.fb_post = 2
          @post.save!
        else
          message = " BUT error from FB: \n" + message          
        end
        flash[:success] = "Post created successfully" + message
      end
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  def update
    if @post.update(post_params)
      if @post.fb_post == 1
        message = post_to_fb(@post) 
        if message == 'Article Posted'
          message = " and posted to Facebook"
          @post.fb_post = 2
          @post.save!
        else
          message = " BUT error from FB: \n" + message          
        end
        flash[:success] = "Post updated successfully" + message
      end
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
      params.require(:post).permit(:post_text, :title, :pinned, :picture_id, :picture_url, :fb_post, :tw_post)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_to_fb(obj)
      
      graph = Koala::Facebook::API.new()

      success_msg = 'Article Posted'
      begin
        post_id = graph.put_wall_post(obj.title + "\n\n" + obj.post_text, {
          #"name" => "order227.co.uk",
          "link" => post_url(obj),
          #"caption" => "Order#227 published a new post",
          #"description" => obj.post_text,
          #"picture" => image_url
        })
      
      rescue Exception => e
        success_msg = e.message
      end
      success_msg
    end
  
    
    
end

