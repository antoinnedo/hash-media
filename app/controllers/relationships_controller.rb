class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(relationship_params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end

  # --- Helper methods ---
  # These methods belong right here in the User model.

  # Follows a user.
  def follow(other_user)
    following << other_user unless self == other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  private

  def relationship_params
    params.require(:relationship).permit(:followed_id)
  end
end
