class AddUserIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :user_id, :integer
    add_index :stories, :user_id
  end
end
