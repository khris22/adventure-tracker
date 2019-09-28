class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
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
