class CreateAskLetters < ActiveRecord::Migration
  def change
    create_table :ask_letters do |t|
      t.string :letter_image
      t.date :date
      t.integer :organization_id

      t.timestamps

    end
  end
end
