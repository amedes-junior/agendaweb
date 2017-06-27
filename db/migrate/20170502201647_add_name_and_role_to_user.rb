class AddNameAndRoleToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role_id, :integer
  end
end
