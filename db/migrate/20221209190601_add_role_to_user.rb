class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, default: 'admin', null: false
  end
end
