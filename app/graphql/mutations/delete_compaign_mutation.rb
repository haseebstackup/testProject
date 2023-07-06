module Mutations
    class DeleteCompaignMutation < BaseMutation
      argument :id, ID, required: true
  
      field :compaign, Types::CompaignType, null: true
  
      def resolve(id:)
        compaign = Compaign.find(id)
        compaign.destroy
  
        { compaign: compaign }
      end
    end
  end
  