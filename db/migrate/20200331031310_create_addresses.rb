class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :apartment_number
      t.string :city
      t.string :postcode
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
