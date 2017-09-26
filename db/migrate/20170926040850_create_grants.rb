class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.integer :amount
      t.string :fiscal_year
      t.date :date_approved
      t.integer :organization_id

      t.timestamps

    end
  end
end
