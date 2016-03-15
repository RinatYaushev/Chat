class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, index: true, null: false
      t.references :user, foreign_key: true, index: true, null: false
      t.column :kind, :integer, default: 0, null: false

      t.timestamps null: false
    end

    add_index :votes, [:user_id, :votable_id, :votable_type], unique: true
  end
end
