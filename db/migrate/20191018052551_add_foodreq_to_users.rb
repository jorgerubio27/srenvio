class AddFoodreqToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :foodreq, :string
  end
end
