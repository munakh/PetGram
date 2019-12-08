class PostsController < ApplicationController

  before_action :redirect_if_user_is_not_signed_in
  respond_to :js, :html, :json

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.sortedbymostrecent
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_url }
      format.js { render layout:false }
    end
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_url }
      format.js { render layout:false }
    end
  end

  def edit
  end

  def show
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  # def find_post
  #   @post = Post.find(params[:id])
  # end
end
