class CreateCompaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :compaigns do |t|
      t.string :title
      t.text :purpose
      t.string :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
