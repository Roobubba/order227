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
      fb_message = ""
      tw_message = ""
      if @post.fb_post == 1
        fb_message = post_to_fb(@post) 
        if fb_message == 'Article Posted'
          fb_message = " and posted to Facebook"
          @post.fb_post = 2
          @post.save
        else
          fb_message = " BUT error from FB: \n" + fb_message          
        end
      end
      if @post.tw_post == 1
        post_to_tw(@post)
        @post.tw_post = 2
        @post.save
        tw_message = " and posted to Twitter"
      end

      flash[:success] = "Post created successfully" + fb_message + tw_message
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  def update
    fb_message = ""
    tw_message = ""
    updated_params = post_params
    if @post.fb_post == 2 && updated_params[:fb_post] == 0
      updated_params[:fb_post] = 2
    end
    if @post.tw_post == 2 && updated_params[:tw_post] == 0
      updated_params[:tw_post] = 2
    end
    
      
    if @post.update(updated_params)
      if @post.fb_post == 1
        fb_message = post_to_fb(@post) 
        if fb_message == 'Article Posted'
          fb_message = " and posted to Facebook"
          @post.fb_post = 2
          @post.save!
        else
          fb_message = " BUT error from FB: \n" + fb_message          
        end
      end
      if @post.tw_post == 1
        post_to_tw(@post)
        @post.tw_post = 2
        @post.save!
        tw_message = " and posted to Twitter"
      end
      flash[:success] = "Post updated successfully" + fb_message + tw_message
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
    
    def post_to_tw(obj)
      twitter = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TW_CONSUMER_KEY']
        config.consumer_secret = ENV['TW_CONSUMER_SECRET']
        config.access_token = ENV['TW_YOUR_ACCESS_TOKEN']
        config.access_token_secret = ENV['TW_YOUR_ACCESS_SECRET']
      end
      
      
      tweet = obj.title + "\n\n" + obj.post_text
      if tweet.length > 100
        tweet = tweet[0,90] + "...\n" + post_url(obj)
      else
        tweet += "\n" + post_url(obj)
      end
      
        twitter.update(tweet)
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

