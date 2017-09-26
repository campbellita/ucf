class Grant < ApplicationRecord
  # Direct associations

  has_many   :checks,
             :dependent => :destroy

  belongs_to :organization,
             :counter_cache => true

  # Indirect associations

  # Validations

end
