class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create]
  before_action :set_comment, only: [:update, :destroy]
  before_action :correct_user, only: [:update, :destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      # Redirect back with an error if saving fails
      redirect_to @post, alert: 'Comment could not be created.'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: 'Comment was successfully updated.'
    else
      redirect_to @comment.post, alert: 'Comment could not be updated.'
    end
  end

  def destroy
    post = @comment.post
    @comment.destroy
    redirect_to post, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def correct_user
    redirect_to(root_url, alert: "Not authorized!") unless @comment.user == current_user
  end
end
