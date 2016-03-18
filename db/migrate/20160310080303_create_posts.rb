class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :type

      t.references :user, index: true
      t.references :room, index: true

      t.timestamps null: false
    end
  end
end
