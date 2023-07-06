class DiscussionTopic < ApplicationRecord

  belongs_to :compaign
  belongs_to :novice
  has_many :comments, as: :commentable ,dependent: :destroy
  validates :title, :novice_id, presence: true


end
