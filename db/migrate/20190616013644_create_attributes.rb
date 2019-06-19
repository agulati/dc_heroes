class CreateAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :attributes do |t|
      t.string :name
      t.string :abbreviation
      t.string :type
      t.string :category
      t.timestamps
    end

    add_index :attributes, :abbreviation, unique: true
  end
end
