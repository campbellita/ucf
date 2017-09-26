class ThankYouLetter < ApplicationRecord
  # Direct associations

  belongs_to :grant

  belongs_to :organization

  # Indirect associations

  # Validations

end
