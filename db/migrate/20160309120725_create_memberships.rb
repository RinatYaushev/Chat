class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, null: false
      t.references :room, index: true, null: false

      t.timestamps null: false
    end

    add_index :memberships, [:user_id, :room_id], unique: true
  end
end
