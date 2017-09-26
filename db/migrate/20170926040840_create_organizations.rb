class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :org_name
      t.string :contact_name
      t.text :address
      t.text :phone

      t.timestamps

    end
  end
end
