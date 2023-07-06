module Mutations
    class CreateCommentMutation < BaseMutation
      argument :title, String, required: true
      argument :discussion_topic_id, ID, required: true
  
      field :comment, Types::CommentType, null: true
  
        def resolve(title:, discussion_topic_id:)
            discussion_topic = DiscussionTopic.find(discussion_topic_id)
            comment = discussion_topic.comments.create(title: title)
    
            { comment: comment }
        end
    end
end
  