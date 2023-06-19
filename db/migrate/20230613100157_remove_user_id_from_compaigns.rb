class RemoveUserIdFromCompaigns < ActiveRecord::Migration[7.0]
  def change
    remove_column :compaigns, :user_id, :integer
  end
end
