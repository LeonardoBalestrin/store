class RemoveCostToProduct < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :cost
  end
end
