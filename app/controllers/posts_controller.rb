class PostsController < ApplicationController

  before_action :redirect_if_user_is_not_signed_in

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

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def show
  #
  # end

  # def update
  #   @post = Post.find(params[:id])
  #   @post.update(post_params)
  #   redirect_to posts_url
  # end

  private

  def post_params
    params.require(:post).permit(:image)
    params.require(:post).permit(:caption)
  end

  # def find_post
  #   @post = Post.find(params[:id])
  # end
end
