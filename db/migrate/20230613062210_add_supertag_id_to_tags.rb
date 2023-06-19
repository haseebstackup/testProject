class AddSupertagIdToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :supertag_id, :integer
  end
end
