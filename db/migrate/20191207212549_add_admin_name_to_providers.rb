class AddAdminNameToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :admin_name, :string
  end
end
