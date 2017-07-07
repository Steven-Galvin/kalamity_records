class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.string :genre
      t.string :length

      t.timestamps
    end
  end
end
