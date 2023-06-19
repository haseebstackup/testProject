class CreateToDos < ActiveRecord::Migration[7.0]
  def change
    create_table :to_dos do |t|
      t.text :task
      t.string :status
      t.references :compaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
