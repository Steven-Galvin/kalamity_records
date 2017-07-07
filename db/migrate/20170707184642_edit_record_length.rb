class EditRecordLength < ActiveRecord::Migration[5.1]
  def change
    remove_column :records, :length
    add_column :records, :album_length, :integer
  end
end
