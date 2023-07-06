module Queries
    class DiscussionTopicsQuery < BaseQuery
      type [Types::DiscussionTopicType], null: false
  
        def resolve
            DiscussionTopic.all
        end
    end
end
  