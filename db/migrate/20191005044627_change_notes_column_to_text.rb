class ChangeNotesColumnToText < ActiveRecord::Migration
  def change
    change_column :adventures, :notes, :text
  end
end
