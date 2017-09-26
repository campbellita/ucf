class AddUserCountToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :users_count, :integer
  end
end
