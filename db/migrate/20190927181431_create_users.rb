class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :foodreq
      t.boolean :admin
      t.boolean :openfr
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
