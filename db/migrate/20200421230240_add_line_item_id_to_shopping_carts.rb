class AddLineItemIdToShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :line_item_id, :integer
  end
end
