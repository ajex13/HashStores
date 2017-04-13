class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
