class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :comments, through: :compaigns
    has_many :comments, through: :discussion_topics
    has_many :comments, dependent: :destroy

    validates :status, inclusion: { in: ["qualified", "not qualified", "banned"] }
    validates :username, uniqueness: true


end
