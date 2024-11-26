class AddEventToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :event, foreign_key: true
  end
end
