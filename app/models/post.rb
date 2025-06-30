class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :responses, through: :comment
  has_many :likes, dependent: :destroy
end
