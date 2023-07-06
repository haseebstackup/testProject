module Mutations
    class CreateDiscussionTopicMutation < BaseMutation
      argument :title, String, required: true
      argument :compaign_id, ID, required: true
  
      field :discussion_topic, Types::DiscussionTopicType, null: true
  
        def resolve(title:, compaign_id:)
            compaign = Compaign.find(compaign_id)
            discussion_topic = compaign.discussion_topics.create(title: title, novice_id: 2)
    
            { discussion_topic: discussion_topic }
        end
    end
end
  