class CreateCharacterAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :character_attributes do |t|
      t.references  :character, foreign_key: true
      t.references  :attribute, foreign_key: true
      t.integer     :value
      t.timestamps
    end
  end
end
