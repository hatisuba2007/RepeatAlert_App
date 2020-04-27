class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :product_number
      t.integer :user_number
      t.integer :salon_id
      t.timestamps
    end
  end
end
