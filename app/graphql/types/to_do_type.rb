module Types
    class TodoType < Types::BaseObject
      field :id, ID, null: false
      field :task, String, null: false
      field :status, String, null: false
    end
end
  