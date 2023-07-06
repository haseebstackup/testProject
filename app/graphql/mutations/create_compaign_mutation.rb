module Mutations
    class CreateCompaignMutation < BaseMutation
      argument :title, String, required: true
      argument :purpose, String, required: true
      argument :duration, String, required: true
  
      field :compaign, Types::CompaignType, null: true
  
        def resolve(title:, purpose:, duration:)
            compaign = Compaign.create(title: title, purpose: purpose, duration: duration, expert_id: 1 )
    
            { compaign: compaign }
        end
    end
end
  