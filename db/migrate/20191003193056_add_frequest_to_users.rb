class AddFrequestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Frequest, :string
  end
end
