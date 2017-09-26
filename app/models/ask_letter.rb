class AskLetter < ApplicationRecord
  mount_uploader :letter_image, LetterImageUploader

  # Direct associations

  belongs_to :organization

  # Indirect associations

  # Validations

end
