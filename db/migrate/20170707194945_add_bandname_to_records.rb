class AddBandnameToRecords < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :artist, :string
  end
end
