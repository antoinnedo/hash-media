class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:create]
  before_action :set_response, only: [:update, :destroy]
  before_action :correct_user, only: [:update, :destroy]

  def create
    @response = @comment.responses.build(response_params)
    @response.user = current_user

    if @response.save
      redirect_to @comment.post, notice: 'Response was successfully created.'
    else
      redirect_to @comment.post, alert: 'Response could not be created.'
    end
  end

  def update
    if @response.update(response_params)
      redirect_to @response.comment.post, notice: 'Response was successfully updated.'
    else
      redirect_to @response.comment.post, alert: 'Response could not be updated.'
    end
  end

  def destroy
    post = @response.comment.post
    @response.destroy
    redirect_to post, notice: 'Response was successfully destroyed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def set_response
    @response = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:content)
  end

  def correct_user
    redirect_to(root_url, alert: "Not authorized!") unless @response.user == current_user
  end
end
