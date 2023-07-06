module Queries
    class CompaignQuery < BaseQuery
      type Types::CompaignType, null: false
      argument :id, ID, required: true
  
        def resolve(id:)
            Compaign.find(id)
        end
    end
end
  