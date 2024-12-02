class RemovePriceFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :price, :integer
  end
end
