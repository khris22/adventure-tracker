class Wishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :title
      t.string :location
      t.string :activity
      t.string :companion
      t.datetime  :created_at
      t.datetime  :updated_at
      t.integer :user_id
    end 
  end
end
