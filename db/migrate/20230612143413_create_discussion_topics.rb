class CreateDiscussionTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :discussion_topics do |t|
      t.string :title
      t.references :compaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
