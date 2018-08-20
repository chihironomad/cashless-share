class AddVisaToStores < ActiveRecord::Migration
  def change
    add_column :stores, :visa, :string
  end
end
