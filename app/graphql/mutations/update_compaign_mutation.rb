module Mutations
    class UpdateCompaignMutation < BaseMutation
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :purpose, String, required: false
      argument :duration, String, required: false
  
      field :compaign, Types::CompaignType, null: true
  
      def resolve(id:, title:, purpose:, duration:)
        compaign = Compaign.find(id)
        compaign.update(title: title, purpose: purpose, duration: duration)
  
        { compaign: compaign }
      end
    end
  end
  