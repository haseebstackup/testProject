class RemoveUserIdFromDiscussionTopics < ActiveRecord::Migration[7.0]
  def change
    remove_column :discussion_topics, :user_id, :integer
  end
end
