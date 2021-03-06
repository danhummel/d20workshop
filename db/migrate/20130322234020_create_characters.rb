class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :characters, [:user_id, :created_at]
  end
end
