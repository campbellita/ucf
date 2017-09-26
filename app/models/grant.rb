class Grant < ApplicationRecord
  # Direct associations

  belongs_to :organization,
             :counter_cache => true

  # Indirect associations

  # Validations

end
