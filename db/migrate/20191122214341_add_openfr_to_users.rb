class AddOpenfrToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :openfr, :boolean
  end
end
