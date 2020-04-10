class AddUserNameToDeviseUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :devise_users, :user_name, :string
  end
end
