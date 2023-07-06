module Queries
    class CompaignsQuery < BaseQuery
      type [Types::CompaignType], null: false
  
        def resolve
            Compaign.all
        end
    end
end
  