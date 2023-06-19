class DiscussionTopic < ApplicationRecord

  belongs_to :compaign
  belongs_to :novice
  has_many :comments, as: :commentable ,dependent: :destroy

end
