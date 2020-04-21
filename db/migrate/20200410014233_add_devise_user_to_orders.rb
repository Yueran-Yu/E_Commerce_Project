class AddDeviseUserToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :devise_user, null: true, foreign_key: true
  end
end
