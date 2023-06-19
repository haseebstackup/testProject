class Compaign < ApplicationRecord

  belongs_to :expert
  has_many :discussion_topics, dependent: :destroy
  has_many :comments, as: :commentable ,dependent: :destroy
  has_many :to_dos, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :duration, inclusion: { in: ['within 1 week', 'within 1 month', 'within 3 months'] }


end
