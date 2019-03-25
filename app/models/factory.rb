class Factory < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  VALID_NUMBER_REGEX = /\A[0-9][0-9]+[0-9]\z/
  validates :id, presence: true,
      format:{with:VALID_NUMBER_REGEX},
      uniqueness: {case_sensitive: false}
end
