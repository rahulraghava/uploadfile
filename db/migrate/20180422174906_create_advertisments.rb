class CreateAdvertisments < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisments do |t|
      t.integer :year
      t.float :kmdriven
      t.integer :ownercount
      t.float :price
      t.string :color
      t.integer :fueltype
      t.references :brand, foreign_key: true
      t.references :user, foreign_key: true
      t.references :variant, foreign_key: true

      t.timestamps
    end
  end
end
