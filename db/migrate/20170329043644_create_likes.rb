class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.boolean :status
      t.string :likeable_type
      t.integer :likeable_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
