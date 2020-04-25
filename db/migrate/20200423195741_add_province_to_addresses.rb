class AddProvinceToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :province, null: true, foreign_key: true
  end
end
