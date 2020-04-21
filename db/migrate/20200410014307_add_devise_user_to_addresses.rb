class AddDeviseUserToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :devise_user, null: true, foreign_key: true
  end
end
