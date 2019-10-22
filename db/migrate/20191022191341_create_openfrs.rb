class CreateOpenfrs < ActiveRecord::Migration[5.2]
  def change
    create_table :openfrs do |t|
      t.string :status

      t.timestamps
    end
  end
end
