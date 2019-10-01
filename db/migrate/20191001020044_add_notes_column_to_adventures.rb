class AddNotesColumnToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :notes, :string
  end
end
