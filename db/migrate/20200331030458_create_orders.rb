class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :o_price
      t.integer :quantity
      t.float :subtotal
      t.float :GST
      t.float :PST
      t.float :HST
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
