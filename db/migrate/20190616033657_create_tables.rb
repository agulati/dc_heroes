class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :type
      t.string :x_label
      t.string :y_label
      t.timestamps
    end
  end
end
