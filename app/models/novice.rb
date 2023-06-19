class Novice < User

    has_many :discussion_topics, dependent: :destroy

end
