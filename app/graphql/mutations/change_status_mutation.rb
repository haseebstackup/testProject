# app/graphql/mutations/change_status_mutation.rb
module Mutations
    class ChangeStatusMutation < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :status, String, required: true
  
      field :user, Types::UserType, null: false
  
        def resolve(id:, status:)
            user = User.find(id)
            user.update(status: status)
            { user: user }
        end
    end
end
  