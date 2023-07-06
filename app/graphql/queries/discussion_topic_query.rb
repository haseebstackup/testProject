module Queries
    class DiscussionTopicQuery < BaseQuery
      type Types::DiscussionTopicType, null: false
      argument :id, ID, required: true
  
        def resolve(id:)
            DiscussionTopic.find(id)
        end
    end
end
  