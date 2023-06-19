class AddExpertDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profession, :string
    add_column :users, :service, :string
  end
end
