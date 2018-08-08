class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name
      t.text :c_card
      t.text :e_money
      t.timestamps null: false
    end
  end
end
