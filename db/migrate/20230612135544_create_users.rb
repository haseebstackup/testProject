class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :username
      t.string :email
      t.string :password
      t.string :status

      t.timestamps
    end
  end
end