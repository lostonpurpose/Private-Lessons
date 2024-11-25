class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :is_teacher, :boolean
    add_column :users, :description, :string
  end
end
