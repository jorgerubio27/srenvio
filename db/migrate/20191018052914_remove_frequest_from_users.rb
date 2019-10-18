class RemoveFrequestFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :Frequest, :string
  end
end
