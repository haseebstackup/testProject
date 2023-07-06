# app/graphql/queries/users_query.rb
module Queries
    class UsersQuery < BaseQuery
      type [Types::UserType], null: false
  
        def resolve
            User.all
        end
    end
end
  