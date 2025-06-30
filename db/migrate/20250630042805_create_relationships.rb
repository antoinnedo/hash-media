class CreateRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    # Add indexes to make finding relationships by user faster
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    # Enforce that a follower can only follow a followed user once
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
