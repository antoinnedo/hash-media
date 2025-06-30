class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.where(user: current_user).first_or_create
    redirect_to @post, notice: "You liked this post."
  end

  def destroy
    @post.likes.where(user: current_user).destroy_all
    redirect_to @post, notice: "You unliked this post."
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
