class CreateBackofficeUsers < ActiveRecord::Migration
  def change
    create_table :backoffice_users do |t|
      t.string :name
      t.string :password_digest

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
