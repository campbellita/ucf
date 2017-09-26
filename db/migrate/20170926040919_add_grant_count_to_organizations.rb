class AddGrantCountToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :grants_count, :integer
  end
end
