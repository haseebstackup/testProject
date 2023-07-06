module Types
    class TagType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :supertag_id, Int, null: true
    end
end
  