class CreateThankYouLetters < ActiveRecord::Migration
  def change
    create_table :thank_you_letters do |t|
      t.string :letter_image
      t.date :date
      t.integer :organization_id
      t.integer :grant_id

      t.timestamps

    end
  end
end
