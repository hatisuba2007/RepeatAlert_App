class CreateSalons < ActiveRecord::Migration[5.1]
  def change
    create_table :salons do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.timestamps
    end
  end
end
