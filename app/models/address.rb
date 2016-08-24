class Address < ApplicationRecord

  POSTCODE_REGEXP = /[1-9]{1}[0-9]{3}[A-Z]{2}/
  COUNTRIES = %w(nl de be)

  before_validation do
    self.postcode = postcode.gsub(/\s/, '').upcase
  end

  belongs_to :user

  validates :name,
    presence: true

  validates :address,
    presence: true

  validates :postcode,
    presence: true,
    format: { with: POSTCODE_REGEXP }

  validates :city,
    presence: true

  validates :country,
    presence: true,
    inclusion: { in: COUNTRIES }

end
