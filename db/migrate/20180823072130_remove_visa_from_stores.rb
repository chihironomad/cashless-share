class RemoveVisaFromStores < ActiveRecord::Migration
  def change
    remove_column :stores, :visa, :string
  end
end
