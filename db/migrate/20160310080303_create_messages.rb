class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content

      t.references :user, index: true, null: false
      t.references :room, index: true, null: false

      t.timestamps null: false
    end
  end
end
