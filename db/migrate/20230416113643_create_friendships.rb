class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: false, index: true
      t.string :status
      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
