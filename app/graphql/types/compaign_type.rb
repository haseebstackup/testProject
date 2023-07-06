module Types
    class CompaignType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :purpose, String, null: false
      field :duration, String, null: false
      field :discussion_topics, [Types::DiscussionTopicType], null: true
    end
end
  