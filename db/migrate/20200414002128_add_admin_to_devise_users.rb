class AddAdminToDeviseUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :devise_users, :is_admin, :boolean
  end
end
