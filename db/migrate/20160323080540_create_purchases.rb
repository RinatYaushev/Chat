class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :quantity, default: 0

      t.references :user, index: true
      t.references :product, index: true
      t.references :order, index: true
    end
  end
end
