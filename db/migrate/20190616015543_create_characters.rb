class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string  :name
      t.integer :initiative
      t.integer :hero_points
      t.timestamps
    end
  end
end
