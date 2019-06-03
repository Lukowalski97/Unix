class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :mail
      t.string :city

      t.timestamps
    end
  end
end
