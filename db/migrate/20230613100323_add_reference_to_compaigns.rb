class AddReferenceToCompaigns < ActiveRecord::Migration[7.0]
  def change
    add_column :compaigns, :expert_id, :integer
  end
end
