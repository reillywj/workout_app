class AddRolesToUsersRemoveRoleTable < ActiveRecord::Migration
  def change
    drop_table :roles
    add_column :users, :role, :string
  end
end
