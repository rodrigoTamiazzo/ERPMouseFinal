class AddRolesMaskToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :roles_mask, :integer
  end
end
