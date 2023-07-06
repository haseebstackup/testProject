class ToDo < ApplicationRecord
  belongs_to :compaign
  validates :task, :status, presence: true
end
