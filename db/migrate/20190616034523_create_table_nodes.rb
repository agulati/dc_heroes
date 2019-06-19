class CreateTableNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :table_nodes do |t|
      t.integer :x_index
      t.integer :x_min
      t.integer :x_max
      t.integer :y_index
      t.integer :y_min
      t.integer :y_max
      t.integer :value
      t.references :table, foreign_key: true
      t.timestamps
    end
  end
end
