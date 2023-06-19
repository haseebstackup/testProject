class AddUserIdToDiscussionTopics < ActiveRecord::Migration[7.0]
  def change
    add_reference :discussion_topics, :user, null: true, foreign_key: true
  end
end
