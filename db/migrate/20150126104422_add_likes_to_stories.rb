class AddLikesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :likes, :integer, default: 0
  end
end
