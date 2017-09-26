class Organization < ApplicationRecord
  # Direct associations

  has_many   :thank_you_letters,
             :dependent => :destroy

  has_many   :grants

  has_many   :users,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
