# app/graphql/types/user_type.rb
module Types
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :username, String, null: false
      field :status, String, null: false
      field :profession, String, null: true
      field :service, String, null: true
      field :type, String, null: false
      field :compaigns, [Types::CompaignType], null: true
      field :discussion_topics, [Types::DiscussionTopicType], null: true
    end
end