class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :avatar_url

      t.timestamps null: false
    end
    add_index :users, :uid
  end
end
