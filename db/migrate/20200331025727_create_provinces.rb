class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :acronym
      t.float :P_GST
      t.float :P_PST
      t.float :P_HST

      t.timestamps
    end
  end
end
