class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower
      t.references :followee

      t.timestamps null: false
    end

    add_index :relationships, [:follower_id, :followee_id], unique: true
  end
end
