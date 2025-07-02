class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :lockable,
         :omniauthable, :timeoutable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :responses, dependent: :destroy

  has_one_attached :avatar

  before_create :skip_confirmation_in_development

  # Relationships where this user is the one doing the following
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :likes, dependent: :destroy

  # Relationships where this user is the one being followed
  has_many :passive_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy

# Add validations for username
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :username, format: { with: /\A[a-zA-Z0-9_.]+\z/, message: "can only contain letters, numbers, underscores, and periods" }

  # This tells Rails to use the username in the URL instead of the ID
  def to_param
    username
  end

  # A list of users that this user is following
  has_many :following, through: :active_relationships, source: :followed

  # A list of users that are following this user
  has_many :followers, through: :passive_relationships, source: :follower

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

  def skip_confirmation_in_development
    self.confirmed_at = Time.current if Rails.env.development?
  end

  def user_params
    # This tells Rails to allow the :avatar attribute to be saved
    params.require(:user).permit(:avatar)
  end
end
