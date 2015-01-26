class AddTitleToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.string :title
    end
  end
end
