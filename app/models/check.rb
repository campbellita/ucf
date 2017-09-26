class Check < ApplicationRecord
  mount_uploader :check_image, CheckImageUploader

  # Direct associations

  belongs_to :grant

  # Indirect associations

  # Validations

end
