class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :check_image
      t.string :account_type
      t.string :check_number
      t.integer :grant_id

      t.timestamps

    end
  end
end
