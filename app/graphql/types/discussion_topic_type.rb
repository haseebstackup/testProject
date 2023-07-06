module Types
    class DiscussionTopicType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :comments, [Types::CommentType], null: true
    end
end
  