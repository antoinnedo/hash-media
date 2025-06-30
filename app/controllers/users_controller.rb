class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    # Find the user by their username
    @user = User.find_by!(username: params[:id])

    # --- Start of New Activity Feed Logic ---

    # 1. Fetch the user's recent content from each model
    @posts = @user.posts.limit(20)
    @comments = @user.comments.includes(:post).limit(20)
    @responses = @user.responses.includes(comment: :post).limit(20)

    # 2. Combine all activities into a single array
    @activities = (@posts + @comments + @responses)

    # 3. Sort the combined array by the creation date, newest first
    @activities = @activities.sort_by(&:created_at).reverse

    # --- End of New Activity Feed Logic ---
  end

end
