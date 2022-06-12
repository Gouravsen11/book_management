class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :edition
      t.integer :publication_year
      t.timestamps
    end
  end
end
