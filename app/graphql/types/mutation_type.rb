module Types
  class MutationType < Types::BaseObject
    # TODO: remove me

    field :changeStatus, mutation: Mutations::ChangeStatusMutation
    field :createCompaign, mutation: Mutations::CreateCompaignMutation
    field :deleteCompaign, mutation: Mutations::DeleteCompaignMutation
    field :updateCompaign, mutation: Mutations::UpdateCompaignMutation
    field :createDiscussionTopic, mutation: Mutations::CreateDiscussionTopicMutation
    field :createComment, mutation: Mutations::CreateCommentMutation

    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
