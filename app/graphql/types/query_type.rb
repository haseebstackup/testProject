module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

    field :users, [UserType], null: false
    field :user, UserType, null: false do
      argument :id, ID, required: true
    end

    field :compaigns, [CompaignType], null: false
    field :compaign, CompaignType, null: false do
      argument :id, ID, required: true
    end
    field :discussionTopics, [DiscussionTopicType], null: false
    field :discussionTopic, DiscussionTopicType, null: false do
      argument :id, ID, required: true
    end


    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end

    def compaigns
      Compaign.all
    end

    def compaign(id:)
      Compaign.find(id)
    end

    def discussionTopics
      DiscussionTopic.all
    end

    def discussionTopic(id:)
      DiscussionTopic.find(id)
    end

    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
