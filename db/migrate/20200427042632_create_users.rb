class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :number
      t.integer :salon_id
      t.string :email
      t.string :name
      t.timestamps
    end
  end
end
