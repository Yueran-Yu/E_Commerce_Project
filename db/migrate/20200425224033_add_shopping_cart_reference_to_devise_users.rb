class AddShoppingCartReferenceToDeviseUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :devise_users, :shopping_cart, null: true, foreign_key: true
  end
end
