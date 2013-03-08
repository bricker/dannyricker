class PostsController < ApplicationController
  before_filter :login_required, only: [:new, :edit, :update, :create, :destroy]
  before_filter :get_post, only: [:show, :edit, :update, :destroy]
  
  respond_to :html
  
  #----------------------
  
  def index
    @posts = Post.order('created_at desc').page(params[:page]).per(3)
  end

  #----------------------
  
  def new
    @post = Post.new
  end
  
  #----------------------
  
  def create
    @post = Post.new(post_params)
    flash[:notice] = "Added post" if @post.save
    respond_with @post
  end
  
  #----------------------

  def update
    flash[:notice] = "Updated post" if @post.update_attributes(post_params)
    respond_with @post
  end

  #----------------------

  def destroy
    flash[:notice] = "Removed post" if @post.destroy
    respond_with @post
  end

  #----------------------

  private

  def get_post
    @post = Post.find(params[:id].to_i)
  end

  #----------------------

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
