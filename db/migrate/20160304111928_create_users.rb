class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :messages_count, default: 0
      t.integer :pings_count, default: 0

      t.timestamps null: false
    end
  end
end
