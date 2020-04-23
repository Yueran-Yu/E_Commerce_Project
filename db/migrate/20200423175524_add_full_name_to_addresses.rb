class AddFullNameToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :full_name, :string
  end
end
