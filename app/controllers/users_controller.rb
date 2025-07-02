class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  # UPDATED: The index action is now dynamic.
  def index
    # Check if a specific user's list is being requested.
    if params[:username].present?
      @profile_user = User.find_by!(username: params[:username])

      if params[:list] == 'followers'
        @title = "Followers of #{@profile_user.username}"
        @users = @profile_user.followers
      elsif params[:list] == 'following'
        @title = "Users followed by #{@profile_user.username}"
        @users = @profile_user.following
      else
        # Fallback if a username is present but the list type is unknown.
        @title = "All Users"
        @users = User.all
      end
    else
      # Default behavior if no specific list is requested.
      @title = "All Users"
      @users = User.all
    end
  end

  def show
    # @user is already set by the before_action.
    @posts = @user.posts.limit(20)
    @comments = @user.comments.includes(:post).limit(20)
    @responses = @user.responses.includes(comment: :post).limit(20)
    @activities = (@posts + @comments + @responses)
    @activities = @activities.sort_by(&:created_at).reverse
  end

  def edit
    # @user is already set by the before_action.
  end

  def update
    # @user is already set by the before_action.
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_back fallback_location: user_url(@user), alert: "Failed to update profile picture." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find_by!(username: params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar)
  end
end
