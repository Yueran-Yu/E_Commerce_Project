class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_
      t.string :name
      t.string :email
      t.string :pwd
      t.string :avatar
      t.boolean :admin

      t.timestamps
    end
  end
end
