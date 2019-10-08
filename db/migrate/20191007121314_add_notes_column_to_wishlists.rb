class AddNotesColumnToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :notes, :text
  end
end
