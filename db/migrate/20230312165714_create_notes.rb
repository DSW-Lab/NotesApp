class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.boolean :is_shared

      t.timestamps
    end
  end
end
