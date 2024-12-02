class MonetizePriceInEvents < ActiveRecord::Migration[7.1]
  def change
    add_monetize :events, :price, currency: { present: false }
  end
end
