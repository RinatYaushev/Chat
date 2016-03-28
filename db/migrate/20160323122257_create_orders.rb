class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 10, scale: 2
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
