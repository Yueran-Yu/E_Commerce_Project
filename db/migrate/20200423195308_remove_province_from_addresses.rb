class RemoveProvinceFromAddresses < ActiveRecord::Migration[6.0]
  def change

    remove_column :addresses, :province, :string
  end
end
