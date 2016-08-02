class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :address
      t.string :city
      t.string :country
      t.string :property_type
      t.integer :no_of_beds
      t.text :description
      t.text :price

      t.timestamps
    end
  end
end
